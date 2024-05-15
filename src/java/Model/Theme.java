/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
public class Theme {
    private String typeId;
    private String typeOfTheme;

    public Theme() {
    }

    public Theme(String typeId, String typeOfTheme) {
        this.typeId = typeId;
        this.typeOfTheme = typeOfTheme;
    }
    public Theme( String typeOfTheme , ArrayList<Theme> themes) {
        this.typeId = generateThemeId(typeOfTheme,themes);
        this.typeOfTheme = typeOfTheme;
    }
    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public String getTypeOfTheme() {
        return typeOfTheme;
    }

    public void setTypeOfTheme(String typeOfTheme) {
        this.typeOfTheme = typeOfTheme;
    }
public static String generateThemeId(String themeName, ArrayList<Theme> themes) {
    // Get the first character of each word in the theme name
    String potentialThemeId = "NT";

    // Check if the potential theme ID already exists in the list of themes
    if (!themeIdExists(themeName, themes)) {
        return potentialThemeId + (themes.size() + 1); // If not, return the potential theme ID
    } else {
        return null;
    }
}

// Check if the theme ID already exists in the list of themes
private static boolean themeIdExists(String themeName, ArrayList<Theme> themes) {
    for (Theme theme : themes) {
        if (theme.getTypeOfTheme().equalsIgnoreCase(themeName)) {
            return true;
        }
    }
    return false;
}
    @Override
    public String toString() {
        return "Theme{" + "typeId=" + typeId + ", typeOfTheme=" + typeOfTheme + '}';
    }
    
}
