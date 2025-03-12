import 'package:flutter/material.dart';
import 'package:name_checker_app/core/theme/app_pallete.dart';

class NotesListviewWidget extends StatelessWidget {
  const NotesListviewWidget({
    super.key,
    required this.notes,
    this.height = 240,
  });

  final List<String> notes;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bullet point icon
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Icon(
                    Icons.note_alt_outlined,
                    size: 20,
                    color: AppPallete.gradient7,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    textAlign: TextAlign.justify,
                    notes[index],
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Pyidaungsu",
                        color: AppPallete.gradient7),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
