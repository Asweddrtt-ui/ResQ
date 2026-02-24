import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart'; // Make sure this is imported!

class IdentityVerificationScreen extends StatefulWidget {
  const IdentityVerificationScreen({super.key});

  @override
  State<IdentityVerificationScreen> createState() => _IdentityVerificationScreenState();
}

class _IdentityVerificationScreenState extends State<IdentityVerificationScreen> {
  // State variables to track if files have been uploaded
  String? _frontIdName;
  String? _backIdName;
  String? _selfieName;

  // Generic function to pick a file and update the correct state variable
  Future<void> _pickImage(String type) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // Restricting to images for IDs/Selfies
    );

    if (result != null) {
      setState(() {
        if (type == 'front') _frontIdName = result.files.single.name;
        if (type == 'back') _backIdName = result.files.single.name;
        if (type == 'selfie') _selfieName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey.withOpacity(0.1),
              ),

              // Main Card
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Container(
                  width: 325.w,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Front ID", style: GoogleFonts.nunito(fontSize: 12.sp, color: Colors.blueGrey[300])),
                          Text("Back ID", style: GoogleFonts.nunito(fontSize: 12.sp, color: Colors.blueGrey[300])),
                          Text("Selfie", style: GoogleFonts.nunito(fontSize: 12.sp, color: Colors.blueGrey[300])),
                        ],
                      ),
                      SizedBox(height: 30.h),

                      // --- HEADER ---
                      Text(
                        "Verify your identity",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "Help keep the ResQ community safe and trustworthy.",
                        style: GoogleFonts.nunito(
                          fontSize: 12.sp,
                          color: Colors.blueGrey[300],
                        ),
                      ),
                      SizedBox(height: 35.h),

                      // --- UPLOAD ROWS ---
                      _buildUploadRow(
                        title: "Front of ID",
                        subtitle: "Upload a clear photo of the front side.",
                        fileName: _frontIdName,
                        onTap: () => _pickImage('front'),
                      ),
                      SizedBox(height: 25.h),

                      _buildUploadRow(
                        title: "Back of ID",
                        subtitle: "Include any important details on the back.",
                        fileName: _backIdName,
                        onTap: () => _pickImage('back'),
                      ),
                      SizedBox(height: 25.h),

                      _buildUploadRow(
                        title: "Personal photo",
                        subtitle: "Take or upload a clear photo of yourself.",
                        fileName: _selfieName,
                        onTap: () => _pickImage('selfie'),
                      ),
                      SizedBox(height: 40.h),

                      // --- FOOTER TEXT ---
                      Center(
                        child: Text(
                          "Your data is encrypted and only used for identity verification.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            fontSize: 10.sp,
                            color: Colors.blueGrey[300],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // --- BUTTONS ---
                      Container(
                        width: double.infinity,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: const Color(0xff5bb381), // Green
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.push("/email_ver");
                          },
                          child: Text(
                            "Back",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        width: double.infinity,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffffa94d), // Orange
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.push("/home");
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- HELPER WIDGET ---

  Widget _buildUploadRow({
    required String title,
    required String subtitle,
    required String? fileName,
    required VoidCallback onTap,
  }) {
    bool isUploaded = fileName != null;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                subtitle,
                style: GoogleFonts.nunito(
                  fontSize: 11.sp,
                  color: Colors.blueGrey[300],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: isUploaded ? const Color(0xff5bb381).withOpacity(0.1) : Colors.transparent,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isUploaded ? "Uploaded" : "Upload",
                  style: GoogleFonts.nunito(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: isUploaded ? const Color(0xff5bb381) : const Color(0xffffa94d),
                  ),
                ),
                if (isUploaded) ...[
                  SizedBox(width: 5.w),
                  Icon(Icons.check_circle, color: const Color(0xff5bb381), size: 14.sp),
                ]
              ],
            ),
          ),
        ),
      ],
    );
  }
}