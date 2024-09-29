import '../config/app_assets.dart';

String getIconPathAsDocType(String path) {
  String docType = path.split('.').last;
  switch (docType) {
    case 'png':
      return AppAssets.IMAGE_ICON;
    case 'jpg':
      return AppAssets.IMAGE_ICON;
    case 'jpeg':
      return AppAssets.IMAGE_ICON;
    case 'pdf':
      return AppAssets.PDF_ICON;
    default:
      return AppAssets.NO_FILE_ICON;
  }
}
