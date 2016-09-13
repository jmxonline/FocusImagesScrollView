//
//  XMSoundBoxPlayBar.h
//  FocusImagesScrollView
//
//  Created by jimmy on 16/9/9.
//  Copyright © 2016年 jmxonline@sina.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XMSoundBoxPlayBarDelegate <NSObject>

- (void)playBar:(__kindof UIView*)bar didTogglePlayPause:(id)sender;
- (void)playBar:(__kindof UIView*)bar didClickedNext:(id)sender;
- (void)playBar:(__kindof UIView*)bar didClickedPrevious:(id)sender;
- (void)playBar:(__kindof UIView*)bar didClickedFav:(id)sender;
- (BOOL)playBarShouldPlaying;

@end

@interface XMSoundBoxPlayBar : UIImageView

@property (nonatomic, weak) id<XMSoundBoxPlayBarDelegate>delegate;

- (void)setTrackCover:(UIImage*)cover;
- (void)setTrackCoverURL:(NSURL*)url;

- (void)setTrackTitle:( NSString* _Nullable )track albumTitle:( NSString* _Nullable )album;

- (void)setHidden:(BOOL)hidden animated:(BOOL)animated;
- (void)updateStateIfNeed;

@end

NS_ASSUME_NONNULL_END