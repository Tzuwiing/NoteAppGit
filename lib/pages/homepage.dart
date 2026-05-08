import 'package:flutter/material.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/pages/note_page.dart';
import 'package:noteapp/service/database_helper.dart';
import 'package:noteapp/widgets/confirm_dialog.dart';
import 'package:noteapp/widgets/note_card.dart';
import 'package:sqflite/sqflite.dart';

class Mainpage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const Mainpage({super.key, required this.onToggleTheme});

  @override
  State<Mainpage> createState() => _MainpageState();
}

//======== STATE ==========
class _MainpageState extends State<Mainpage> {
  List<Note> notes = [];

  //=========== LOAD DATA (DATABASE -> UI) ===========
  Future<void> loadNotes() async {
    final data = await DatabaseHelper.instance.getAllNotes();

    setState(() {
      notes = data;
    });
  }

  // ===============NAVIGATION HANDLER +  CRUD ================

  // ============ ADD ==============
  // void addNote(Note note) {
  //   setState(() {
  //     notes.add(note);
  //   });
  // }

  // // ============ UPDATE ==============
  // void updateNote(int index, Note note) {
  //   setState(() {
  //     notes[index] = note;
  //   });
  // }

  // // ============ DELETE ==============

  // void deleteNote(int index) async {
  //   bool confirm = await showConfirmDialog(context);
  //   if (confirm) {
  //     setState(() {
  //       notes.removeAt(index);
  //     });
  //   }
  // }

  // =========== NAVIGATION (KEEP STYLE) ==============

  void goToNotePage({Note? note, int? index}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => NotePage(note: note)),
    );

    //========= INIT (PERTAMA KALI LOAD DATA) ===========
    @override
    void initState() {
      super.initState();
      loadNotes();
    }

    //========= DELETE ===========
    if (result == "delete" && index != null) {
      await DatabaseHelper.instance.deleteNote(note!.id!);
      await loadNotes();

      // ======= UPDATE ===========
    } else if (result is Note && index != null) {
      await DatabaseHelper.instance.updateNote(result);
      await loadNotes();

      //========== INSERT ===========
    } else if (result is Note) {
      await DatabaseHelper.instance.inertNote(result);
      await loadNotes();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notes"),
        actions: [
          IconButton(
            onPressed: widget.onToggleTheme,
            icon: const Icon(Icons.dark_mode),
          ),
        ],
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: notes.isEmpty
          ? Center(child: Text("No Notes", style: theme.textTheme.bodyMedium))
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: notes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return NoteCard(
                  note: notes[index],

                  //======= EDIT ===========
                  onEdit: () => goToNotePage(note: notes[index]),

                  //======= DELETE ===========
                  onDelete: () => goToNotePage(note: notes[index]),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToNotePage();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
