import 'package:flutter/material.dart';

Future <bool> showConfirmDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text("Konfirmasi"),
      content: const Text("Apakah Anda yakin ingin menghapus catatan ini?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text("Batal"),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text("Hapus"),
        ),
      ],
    ),
  ) ?? false;
}