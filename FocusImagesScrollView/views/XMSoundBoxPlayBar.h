//
//  XMSoundBoxPlayBar.h
//  FocusImagesScrollView
//
//  Created by jimmy on 16/9/9.
//  Copyright © 2016年 jmxonline@sina.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XMSoundBoxPlayBarDelegate <NSObject>

- (void)playBar:(__kindof UIView*)bar didTogglePlayPause:(id)sender;
- (void)playBar:(__kindof UIView*)bar didClickedNext:(id)sender;
- (void)playBar:(__kindof UIView*)bar didClickedPrevious:(id)sender;

- (BOOL)playBarShouldPlaying;

@end

@interface XMSoundBoxPlayBar : UIImageView

@property (nonatomic, weak) id<XMSoundBoxPlayBarDelegate>delegate;

- (void)setTrackCover:(UIImage*)cover;
- (void)setTrackCoverURL:(NSURL*)url;

- (void)setHidden:(BOOL)hidden animated:(BOOL)animated;
- (void)updateStateIfNeed;
@end
