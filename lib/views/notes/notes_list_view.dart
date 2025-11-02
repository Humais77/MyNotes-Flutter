import 'package:flutter/material.dart';
import 'package:my_app/services/cloud/cloud_note.dart';
import 'package:my_app/utilites/dialogs/delete_dialog.dart';

typedef NoteCallback = void Function(CloudNote note);

class NotesListView extends StatelessWidget {
  final Iterable<CloudNote> notes;
  final NoteCallback onDeleteNote;
  final NoteCallback onTap;

  const NotesListView({
    super.key,
    required this.notes,
    required this.onDeleteNote,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) {
      return const Center(
        child: Text(
          "No notes yet. Start creating one!",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes.elementAt(index);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () => onTap(note),
            splashColor: Colors.blue.withValues(alpha: 0.1),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              color: Colors.white,
              shadowColor: Colors.grey.withValues(alpha: 0.2),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                title: Text(
                  note.text.isNotEmpty ? note.text : "(Empty Note)",
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  child: const Icon(Icons.note_alt, color: Colors.blue),
                ),
                trailing: IconButton(
                  tooltip: "Delete Note",
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.redAccent,
                  ),
                  onPressed: () async {
                    final shouldDelete = await showDeleteDialog(context);
                    if (shouldDelete) {
                      onDeleteNote(note);
                    }
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
