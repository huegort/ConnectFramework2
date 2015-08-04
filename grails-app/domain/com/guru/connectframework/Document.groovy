package com.guru.connectframework

import com.guru.connectframework.documents.FileType

class Document extends CfEntity{
    String filename
    byte[] filedata
    Date uploadDate = new Date()
    FileType fileType
    long fileSize

    Date dateArchived

    static constraints = {
        filename(blank:false,nullable:false)
        filedata(blank: true, nullable:true, maxSize:1073741824)
        dateArchived nullable: true
    }
}
