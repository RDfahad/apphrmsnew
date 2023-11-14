import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:hr_emp_proj/ui/screens/document_overview.dart/document_bloc/document_bloc.dart';
import 'package:hr_emp_proj/ui/screens/document_overview.dart/document_bloc/document_state.dart';
import '/utils/extension_methods.dart';

import '../../../../utils/app_color.dart';

class DocumentOverViewScreen extends StatelessWidget {
  const DocumentOverViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      body: BlocBuilder<DocumentCubit, DocumentState>(
        builder: (context,DocumentState state){
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: context.getScreenWidth,
                  padding: EdgeInsets.symmetric(
                      horizontal: context.getScreenWidth * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.getScreenWidth * 0.02),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFF0b84c8),
                                Color(0xff214cbd),
                                Color(0xff214cbd),
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            )),
                        height: context.getScreenHeight * 0.2,
                        width: context.getScreenWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back,color: AppColor.whiteColor,),
                              onPressed: () {
                                Navigator.pop(context);
                              },),
                            const SizedBox(height: 15,),
                            const Text(
                              "Document",
                              style: TextStyle(
                                  color: AppColor.primaryTextWhiteColor,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w300),
                            ),
                            const Text(
                              "Overview",
                              style: TextStyle(
                                  color: AppColor.primaryTextWhiteColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: context.getScreenHeight * 0.03),
                      Row(
                        children: [
                          Flexible(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: TextField(
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.search),
                                      prefixIconColor:
                                      AppColor.secondaryTextColor.withOpacity(0.5),
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        color: AppColor.secondaryTextColor
                                            .withOpacity(0.5),
                                      )),
                                ),
                              )),
                          SizedBox(
                            height: context.getScreenHeight * 0.045,
                            child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.primaryButtonColor),
                                onPressed: () {},
                                icon: Image.asset("assets/icons/filter_icon1.png"),
                                label: const Text(
                                  " Filter ",
                                  style: TextStyle(color: AppColor.whiteColor),
                                )),
                          )
                        ],
                      ),
                      !state.isLoading? ListView.builder(
                        shrinkWrap: true,
                          itemCount: state.documentData.documents?.length,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index){
                        return Container(
                          padding: EdgeInsets.all(context.getScreenHeight * 0.02),
                          margin: EdgeInsets.only(top: context.getScreenHeight * 0.03),
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  spreadRadius: 0.2,
                                  color: AppColor.primaryColor,
                                  blurRadius: 5,
                                ),
                              ],
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildInfoRow("Title:", state.documentData.documents?[index].title ?? ''),
                              _buildInfoRow("Category:", state.documentData.documents?[index].category ?? ''),
                              _buildInfoRow("Status:", state.documentData.documents?[index].type ?? ''),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildInfoRow("Type:", state.documentData.documents?[index].type ?? ''),
                                  Row(
                                    children: [
                                      InkWell(
                                          onTap:()async{
                                            FileDownloader.downloadFile(
                                                url: state.documentData.documents?[index].url ?? '',

                                                // name: **OPTIONAL**, //THE FILE NAME AFTER DOWNLOADING,
                                                // onProgress: (String fileName, double progress) {
                                                //   print('FILE fileName HAS PROGRESS $progress');
                                                // },
                                                onDownloadCompleted: (String path) {
                                                  print('FILE DOWNLOADED TO PATH: $path');
                                                },
                                                onDownloadError: (String error) {
                                                  print('DOWNLOAD ERROR: $error');
                                                });
                                            // log(state.documentData.documents?[index].url ?? 'asdasd');
                                            // // String dir = (await getApplicationDocumentsDirectory()).path+ DateTime.now().millisecondsSinceEpoch.toString() + '';
                                            // // var filename = DateTime.now().millisecondsSinceEpoch.toString();
                                            // // log(dir);
                                            // String localPath = '${(await getApplicationDocumentsDirectory()).path}${Platform.pathSeparator}Download';
                                            // final savedDir = Directory(localPath);
                                            // bool hasExisted = await savedDir.exists();
                                            // if (!hasExisted) {
                                            //   savedDir.create();
                                            // }
                                            // await FlutterDownloader.enqueue(
                                            //   fileName: DateTime.now().millisecondsSinceEpoch.toString()+'.png',
                                            //   url: state.documentData.documents?[index].url ?? '',
                                            //   savedDir: localPath,
                                            //   showNotification: true, // show download progress in status bar (for Android)
                                            //   openFileFromNotification: true, // click on notification to open downloaded file (for Android)
                                            // );
                                          },
                                          child: Image.asset("assets/icons/download_icon.png")),
                                      const SizedBox(width: 10),
                                      Image.asset("assets/icons/square_grid.png"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }): Padding(
                        padding: EdgeInsets.only(top: context.getScreenHeight * 0.05),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(height: context.getScreenHeight * 0.03),
                      // Container(
                      //   padding: EdgeInsets.all(context.getScreenHeight * 0.02),
                      //   decoration: BoxDecoration(
                      //       boxShadow: const [
                      //         BoxShadow(
                      //           spreadRadius: 0.2,
                      //           color: AppColor.primaryColor,
                      //           blurRadius: 5,
                      //         ),
                      //       ],
                      //       color: AppColor.whiteColor,
                      //       borderRadius: BorderRadius.circular(12)),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       _buildInfoRow("Title:", ""),
                      //       _buildInfoRow("Category:", ""),
                      //       _buildInfoRow("Status:", ""),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           _buildInfoRow("Type:", ""),
                      //           Row(
                      //             children: [
                      //               Image.asset("assets/icons/download_icon.png"),
                      //               const SizedBox(width: 10),
                      //               Image.asset("assets/icons/square_grid.png"),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(height: context.getScreenHeight * 0.03),
                      // Container(
                      //   padding: EdgeInsets.all(context.getScreenHeight * 0.02),
                      //   decoration: BoxDecoration(
                      //       boxShadow: const [
                      //         BoxShadow(
                      //           spreadRadius: 0.2,
                      //           color: AppColor.primaryColor,
                      //           blurRadius: 25,
                      //         ),
                      //       ],
                      //       color: AppColor.whiteColor,
                      //       borderRadius: BorderRadius.circular(12)),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       _buildInfoRow("Title:", ""),
                      //       _buildInfoRow("Category:", ""),
                      //       _buildInfoRow("Status:", ""),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           _buildInfoRow("Type:", ""),
                      //           Row(
                      //             children: [
                      //               Image.asset("assets/icons/download_icon.png"),
                      //               const SizedBox(width: 10),
                      //               Image.asset("assets/icons/square_grid.png"),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(height: context.getScreenHeight * 0.03),
                    ],
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

Widget _buildInfoRow(String label, String value) {
  return Row(
    children: [
      Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 12,
          color: AppColor.secondaryTextColor,
        ),
      ),
      Text(
        value,
        style: const TextStyle(
          fontSize: 16,
          color: AppColor.blackColor,
        ),
      ),
    ],
  );
}
