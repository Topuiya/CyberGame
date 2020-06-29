//
//  GameSortTabCell.m
//  CyberGame
//
//  Created by apple on 2020/6/5.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "GameSortTabCell.h"

@implementation GameSortTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (SCREEN_WIDTH == 375) {
        self.leftWid.constant = self.rightWid.constant = 10;
    }
    else if (SCREEN_WIDTH == 414) {
        self.leftWid.constant = self.rightWid.constant = 22;
    }
    
    self.lolView.userInteractionEnabled = YES;
    UITapGestureRecognizer *lolViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSelectedLolView)];
    [self.lolView addGestureRecognizer:lolViewTap];
    
    self.owView.userInteractionEnabled = YES;
    UITapGestureRecognizer *owViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSelectedOwView)];
    [self.owView addGestureRecognizer:owViewTap];
    
    self.wzryView.userInteractionEnabled = YES;
    UITapGestureRecognizer *wzryViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSelectedWzryView)];
    [self.wzryView addGestureRecognizer:wzryViewTap];
    
    self.pubgView.userInteractionEnabled = YES;
    UITapGestureRecognizer *pubgViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSelectedPubgView)];
    [self.pubgView addGestureRecognizer:pubgViewTap];
}

- (void)didSelectedLolView {
    if ([self.delegate respondsToSelector:@selector(didSelectedLolView)]) {
        [self.delegate didSelectedLolView];
    }
}

- (void)didSelectedOwView {
    if ([self.delegate respondsToSelector:@selector(didSelectedOwView)]) {
        [self.delegate didSelectedOwView];
    }
}

- (void)didSelectedWzryView {
    if ([self.delegate respondsToSelector:@selector(didSelectedWzryView)]) {
        [self.delegate didSelectedWzryView];
    }
}

- (void)didSelectedPubgView {
    if ([self.delegate respondsToSelector:@selector(didSelectedPubgView)]) {
        [self.delegate didSelectedPubgView];
    }
}
@end
