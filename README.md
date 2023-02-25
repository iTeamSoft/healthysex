# healthysex

A new Flutter project.

## Version 18 Add Ads 
1.build gradle (Project) Modification of Kotline version
2.Manifest.xml    
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="com.google.android.gms.permission.AD_ID"/>
3.Stack of ads on the Grid or Web View Low hierarchy as it ia poaaiple.
4.Build Gradle (App) We Add :
	dependencies {
    implementation 'androidx.multidex:multidex:2.0.1'
    implementation 'com.google.android.gms:play-services-ads:21.5.0'
    implementation 'com.android.support:multidex:1.0.3'
			}
And        defaultConfig {
			multiDexEnabled true
			minSdkVersion 19}

5.Reinstall App in Device
6. Flutter Clean
7. Flutter Clear Cashe
8.Remove Pubesc.lock
9.Invalidate Cashe and Restart

