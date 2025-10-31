/*
 * *****************************************************************************
 * Copyright (C) 2014-2025 Dennis Sheirer
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 * ****************************************************************************
 */

package io.github.dsheirer.preference.colortheme;

import io.github.dsheirer.preference.Preference;
import io.github.dsheirer.preference.PreferenceType;
import io.github.dsheirer.sample.Listener;
import java.util.prefs.Preferences;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Color theme preferences for the application UI
 */
public class ColorThemePreference extends Preference
{
    private static final String PREFERENCE_KEY_DARK_MODE_ENABLED = "color.theme.dark.mode.enabled";
    
    private final static Logger mLog = LoggerFactory.getLogger(ColorThemePreference.class);
    private Preferences mPreferences = Preferences.userNodeForPackage(ColorThemePreference.class);
    private Boolean mDarkModeEnabled;

    /**
     * Constructs an instance
     * @param updateListener to receive notifications that a preference has been updated
     */
    public ColorThemePreference(Listener<PreferenceType> updateListener)
    {
        super(updateListener);
    }

    @Override
    public PreferenceType getPreferenceType()
    {
        return PreferenceType.COLOR_THEME;
    }

    /**
     * Indicates if dark mode is enabled.
     * @return true if dark mode is enabled.
     */
    public boolean isDarkModeEnabled()
    {
        if(mDarkModeEnabled == null)
        {
            mDarkModeEnabled = mPreferences.getBoolean(PREFERENCE_KEY_DARK_MODE_ENABLED, false);
        }

        return mDarkModeEnabled;
    }

    /**
     * Sets the dark mode enabled state.
     * @param enabled true to enable dark mode.
     */
    public void setDarkModeEnabled(boolean enabled)
    {
        mDarkModeEnabled = enabled;
        mPreferences.putBoolean(PREFERENCE_KEY_DARK_MODE_ENABLED, enabled);
        notifyPreferenceUpdated();
    }
}

