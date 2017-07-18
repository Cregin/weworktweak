
#import <CoreLocation/CoreLocation.h>
#import "WWSettingHelper.h"
#import "SSSettingViewController.h"





%hook AppDelegate
- (BOOL)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    double latitude = [user doubleForKey:@"pilgrimLatitude"];
    double longitude = [user doubleForKey:@"pilgrimLongitude"];
    if (latitude == 0.0) {
        [user setDouble:30.545008 forKey:@"pilgrimLatitude"];
    }
    if (longitude == 0.0) {
        [user setDouble:104.066300 forKey:@"pilgrimLongitude"];
    }
    [user synchronize];
    %orig(arg1, arg2);
    return YES;
}
%end

%hook QMapView
- (void)locationManager:(id)arg1 didUpdateToLocation:(id)arg2 fromLocation:(id)arg3
{
    CLLocation * oldLocation = (CLLocation *)arg2;
    //30.544531,104.065965
    //30.545008, 104.066300
    NSString * latitudeStr = [[NSUserDefaults standardUserDefaults] stringForKey:@"pilgrimLatitude"];
    NSString * longitudeStr = [[NSUserDefaults standardUserDefaults] stringForKey:@"pilgrimLongitude"];
    if (latitudeStr == nil) {
        latitudeStr = @"30.545608";
    }
    if (longitudeStr == nil) {
        longitudeStr = @"104.066300";
    }
    double myLatitude = [latitudeStr doubleValue];
    double myLongitude = [longitudeStr doubleValue];
    CLLocation * newLocation = [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake(myLatitude, myLongitude) altitude:oldLocation.altitude horizontalAccuracy:oldLocation.horizontalAccuracy verticalAccuracy:oldLocation.verticalAccuracy course:oldLocation.course speed:oldLocation.speed timestamp:oldLocation.timestamp];
    oldLocation = newLocation;
    NSLog(@"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%@~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", oldLocation);
    NSLog(@"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%@~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", arg3);
    %orig(arg1, oldLocation, arg3);
}
%end

%hook WWKMessageListController

- (void)onDidDoubleClickTabBar { 
    SSSettingViewController *settingViewController = [SSSettingViewController new];
    [self.navigationController pushViewController:settingViewController animated:YES];
    %orig;
}

%end
