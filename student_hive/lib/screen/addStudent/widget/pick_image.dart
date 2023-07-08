import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
    required this.image,
    required this.pickImagProfile,
  });
  final String? image;
  final Function pickImagProfile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: image == null ? Colors.blue : Colors.transparent,
            radius: 40,
            backgroundImage:
                image == null ? null : FileImage(File(image.toString())),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () async {
            return showModalBottomSheet(
              context: context,
              builder: (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.camera),
                    title: const Text("Camera"),
                    onTap: () => pickImagProfile(ImageSource.camera),
                  ),
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: const Text("Image"),
                    onTap: () => pickImagProfile(ImageSource.gallery),
                  )
                ],
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 0.1,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "Add Profile Picture",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        )
      ],
    );
  }
}
