//
//  FihghtThemeCell.m
//  CyberGame
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "FihghtThemeCell.h"
#import "UIColor+Hex.h"
#import "UIImage+Image.h"
#import "UIImage+OriginalImage.h"

@implementation FihghtThemeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setBtnStyle];
}

- (void)setBtnStyle {
    //wzryBtn
    self.wzryBtn.backgroundColor = [UIColor colorWithHexString:@"#F1F1F0"];
    self.wzryBtn.tintColor = [UIColor colorWithHexString:@"#666666"];
    //lscsBtn
    self.lscsBtn.backgroundColor = [UIColor colorWithHexString:@"#F1F1F0"];
    self.lscsBtn.tintColor = [UIColor colorWithHexString:@"#666666"];
    //lolBtn
    self.lolBtn.backgroundColor = [UIColor colorWithHexString:@"#F1F1F0"];
    self.lolBtn.tintColor = [UIColor colorWithHexString:@"#666666"];
    //owBtn
    self.owBtn.backgroundColor = [UIColor colorWithHexString:@"#F1F1F0"];
    self.owBtn.tintColor = [UIColor colorWithHexString:@"#666666"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
