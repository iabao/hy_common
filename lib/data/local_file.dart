/*
 * 实现功能：操作本地文件
 * 
 * 创建时间：2019-10-21
 */
import 'dart:io';
import 'package:path_provider/path_provider.dart';

abstract class HyOperateLocalFile {
  Future<Null> writeFile(String content) async {
    File file = await _getLocalFile();
    if (!file.existsSync()) {
      await file.create();
    }
    file.writeAsStringSync(content);
  }

  Future<String> readFile() async {
    File file = await _getLocalFile();
    if (file.existsSync()) {
      return file.readAsStringSync();
    } else {
      return null;
    }
  }

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    String dirPath = "$dir/${getDirName()}";
    // LogUtil.i("logUtil", dirPath);
    Directory directory = Directory(dirPath);
    if (!directory.existsSync()) {
      await directory.create();
    }
    String filePath = "$dirPath/${getFileName()}";
    // LogUtil.i("logUtil", filePath);
    return new File(filePath);
  }

  String getDirName();

  String getFileName();
}
