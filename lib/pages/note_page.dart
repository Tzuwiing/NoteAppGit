import 'package:flutter/material.dart';
import 'package:noteapp/models/note_model.dart';

class NotePage extends StatefulWidget {
  final Note? note;
  const NotePage({super.key, this.note});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final authorController = TextEditingController();
  @override
  bool _isSaving = false;

  //============= INIT ================
  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      contentController.text = widget.note!.content;
      authorController.text = widget.note!.author;
    }
  }

  //============= DISPOSE============
  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    authorController.dispose();
    super.dispose();
  }

  //============= SAVE NOTE =============

  void saveNote() {
    if (_isSaving) return;
    _isSaving = true;

    if (!mounted) return;

    // VALIDASI INPUT
    if (titleController.text.trim().isEmpty &&
        contentController.text.trim().isEmpty) {
      Navigator.pop(context);
      return;
    }

    final now = DateTime.now().toIso8601String();

    final note = Note(
      id: widget.note?.id,
      title: titleController.text,
      content: contentController.text,
      author: authorController.text,
      createdAt: widget.note?.createdAt ?? now,
      updatedAt: now,
    );
    Navigator.pop(context, note);
  }

  //=========== DELETE NOTE =============
  void deleteNote() async {
    final confirm = await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Konfirmasi"),
        content: const Text("Apakah Anda yakin ingin menghapus catatan ini?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Hapus"),
          ),
        ],
      ),
    );
    if (confirm == true) {
      Navigator.pop(context, "delete");
    }
  }
//============= UI ============
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);


    return PopScope(

      //HANDLE BACK SYSTEM
      canPop: false,


      onPopInvokedWithResult: (didPop, result) {
        if (didPop || _isSaving)  return;
        _isSaving = true;


        //AMBIL NAVIGATOR SEBELUM DIPAKAI
        final navigator = Navigator.of(context);
        saveNote();

        navigator.pop();
      },


      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: saveNote,
          ),
          actions: [
            IconButton(
              onPressed: deleteNote,
              icon: const Icon(Icons.delete_outline),
            ),
          ],
        ),
      
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ========TITLE========
              TextField(
                controller: titleController,
                autofocus: true,
                style: Theme.of(context).textTheme.titleLarge,
                decoration: const InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 8),
      
              Expanded(
                child: TextField(
                  controller: contentController,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: null,
                  expands: true,
                  decoration: const InputDecoration(
                    hintText: "Note",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Divider(
                color: Theme.of(context).dividerColor.withValues(alpha: 0.3),
              ),
              SizedBox(height: 8),
              TextField(
                controller: authorController,
                decoration: const InputDecoration(
                  hintText: "Author",
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
