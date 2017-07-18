@interface WWSettingHelper : NSObject

@property(copy, nonatomic) NSString *settingTitle;

@end

@interface WWKMessageListController : UIViewController
@property(copy, nonatomic) NSString *title;
@property(retain, nonatomic) UIView *titleView;
- (void)onDidDoubleClickTabBar;;
- (void)onClickTitleView:(id)arg1;
@end
