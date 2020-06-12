//
//  FeaturedLol.m
//  CyberGame
//
//  Created by apple on 2020/6/10.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "FeaturedLol.h"

@interface FeaturedLol ()

@end

@implementation FeaturedLol

- (void)viewDidLoad {
    if (SCREEN_WIDTH == 414) {
        self.headViewHeight.constant = 172.3;
    }else if (SCREEN_WIDTH == 375) {
        self.headViewHeight.constant = 156;
    }
}

-(UIView *)listView{
    return self.view;
}

@end
