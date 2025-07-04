import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/domain/models/note_model.dart';
import 'package:note_app/presentation/providers/note_provider.dart';
import 'package:note_app/presentation/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatelessWidget {
  final titleController = TextEditingController();
  final messageController = TextEditingController();

  AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text("Add Note", style: TextStyle(fontSize: 20.sp)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Center(
          child: Container(
            width: 600.w.clamp(0, 600), // max width for tablets
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.r,
                  spreadRadius: 2.r,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Create a New Note 📝",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),

                // Title TextField
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    prefixIcon: Icon(Icons.title, size: 24.sp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(height: 24.h),

                // Message TextField with label and icon in same row inside field
                TextField(
                  controller: messageController,
                  maxLines: 6,
                  decoration: InputDecoration(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.message_outlined,
                          size: 20.sp,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          "Message",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    hintText: "Write your note here...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    contentPadding: EdgeInsets.all(14.w),
                  ),
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(height: 30.h),

                // Save Button
               CustomButton(text: "Save Note", onPressed: () {
                      noteProvider.addNote(
                        NoteModel(
                          title: titleController.text.trim(),
                          message: messageController.text.trim(),
                          id: DateTime.now().toIso8601String(),
                        ),
                        messageController.text,
                      );
                      Navigator.pop(context);
                    },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
