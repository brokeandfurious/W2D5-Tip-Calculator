//
//  Bill.h
//  W2D5-Tip-Calculator
//
//  Created by Murat Ekrem Kolcalar on 11/22/17.
//  Copyright © 2017 murtilicious. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface Bill : NSObject

@property (nonatomic) NSNumber* totalBill;
@property (nonatomic) NSNumber* totalTip;

- (instancetype) initWithTipAmount: (NSNumber*)tip;

@end
