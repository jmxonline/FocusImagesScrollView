//
//  XMHCollectionViewCell.m
//  FocusImagesScrollView
//
//  Created by jimmy on 16/9/6.
//  Copyright © 2016年 jmxonline@sina.com. All rights reserved.
//

#import "XMHCollectionViewCell.h"
#import "XMUIDefines.h"

@implementation XMHCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupContent];
    }
    return self;
}

- (void)setupContent
{
    self.backgroundColor = [UIColor whiteColor];
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [self.contentView addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_titleLabel];
}

- (void)layoutSubviews
{
#define marginY 10
#define gapY    8
    [super layoutSubviews];
    //[_imageView sizeToFit];
    MoveTo(_imageView, (self.frame.size.width - _imageView.frame.size.width)/2, marginY);
    [_titleLabel sizeToFit];
    MoveTo(_titleLabel, (self.frame.size.width - _titleLabel.frame.size.width)/2, marginY + _imageView.frame.size.height + gapY);
}

@end
