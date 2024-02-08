package com.cafeapp.dto.file;

import lombok.Data;

@Data
public class File {
int fileID;
String fileName;
String originalFileName;
String filePath;
String fileExtension;
int fileSize;
}
