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
    self.lolView.userInteractionEnabled = YES;
    UITapGestureRecognizer *lolViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didLolViewClick)];
    [self.lolView addGestureRecognizer:lolViewTap];
    
    self.owView.userInteractionEnabled = YES;
    UITapGestureRecognizer *owViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didOwViewClick)];
    [self.owView addGestureRecognizer:owViewTap];
    
    self.wzryView.userInteractionEnabled = YES;
    UITapGestureRecognizer *wzryViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didWzryViewClick)];
    [self.wzryView addGestureRecognizer:wzryViewTap];
    
    self.pubgView.userInteractionEnabled = YES;
    UITapGestureRecognizer *pubgViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didPubgViewClick)];
    [self.pubgView addGestureRecognizer:pubgViewTap];
}

- (void)didLolViewClick {
    if (_selectedLolViewBlock) {
        _selectedLolViewBlock();
    }
}

- (void)didOwViewClick {
    if (_selectedOwViewBlock) {
        _selectedOwViewBlock();
    }
}

- (void)didWzryViewClick {
    if (_selectedWzryViewBlock) {
        _selectedWzryViewBlock();
    }
}

- (void)didPubgViewClick {
    if (_selectedPubgViewBlock) {
        _selectedPubgViewBlock();
    }
}
@end
