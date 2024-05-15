/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import static Model.Genre.generateGenreId;
import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
public class Format {
    private String typeId;
    private String typeOfFormat;

    public Format() {
    }

    public Format(String typeId, String typeOfFormat) {
        this.typeId = typeId;
        this.typeOfFormat = typeOfFormat;
    }
public Format( String typeOfFormat , ArrayList<Format> formats) {
        this.typeId = generateFormatId(typeOfFormat,formats);
        this.typeOfFormat = typeOfFormat;
    }
    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public String getTypeOfFormat() {
        return typeOfFormat;
    }

    public void setTypeOfFormat(String typeOfFormat) {
        this.typeOfFormat = typeOfFormat;
    }
    public static String generateFormatId(String formatName, ArrayList<Format> formats) {
    // Get the first character of each word in the format name
    String potentialFormatId = "NF";

    // Check if the potential format ID already exists in the list of formats
    if (!formatIdExists(formatName, formats)) {
        return potentialFormatId + (formats.size() + 1); // If not, return the potential format ID
    } else {
        return null;
    }
}

// Check if the format ID already exists in the list of formats
private static boolean formatIdExists(String formatName, ArrayList<Format> formats) {
    for (Format format : formats) {
        if (format.getTypeOfFormat().equalsIgnoreCase(formatName)) {
            return true;
        }
    }
    return false;
}
    @Override
    public String toString() {
        return "Format{" + "typeId=" + typeId + ", typeOfFormat=" + typeOfFormat + '}';
    }
    
}
