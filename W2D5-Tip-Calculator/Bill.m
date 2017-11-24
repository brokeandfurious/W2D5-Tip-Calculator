//
//  Bill.m
//  W2D5-Tip-Calculator
//
//  Created by Murat Ekrem Kolcalar on 11/22/17.
//  Copyright © 2017 murtilicious. All rights reserved.
//

#import "Bill.h"

@implementation Bill

- (instancetype) initWithTipAmount: (NSNumber*)tip {
    if (self = [super init]) {
        NSNumber *randomNumber = [NSNumber numberWithUnsignedInt:arc4random_uniform(600)];
        _totalBill = randomNumber;
        _totalTip = @([self.totalBill floatValue] * [tip floatValue] / 100);
        NSLog(@"Bill: %@, Tip: %@", self.totalBill, self.totalTip);
    }
    return self;
}


@end
