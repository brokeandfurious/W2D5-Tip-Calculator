//
//  ViewController.m
//  W2D5-Tip-Calculator
//
//  Created by Murat Ekrem Kolcalar on 11/22/17.
//  Copyright © 2017 murtilicious. All rights reserved.
//

#import "ViewController.h"
#import "Bill.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelForBill;
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;

@property (nonatomic) NSArray *sliderValues;
@property (nonatomic) NSNumber *totalBill;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.tipAmountToBePassed) {
        self.tipAmountToBePassed = @(15);
    }
    
    Bill *bill = [[Bill alloc]initWithTipAmount:self.tipAmountToBePassed];
    self.labelForBill.text = [NSString stringWithFormat:@"$%@", bill.totalBill];
    self.totalBill = bill.totalBill;
    
    self.sliderValues = @[@(10), @(15), @(18), @(20), @(25)];
    NSInteger numberOfSteps = ((float)[self.sliderValues count] - 1);
    self.tipSlider.maximumValue = numberOfSteps;
    self.tipSlider.minimumValue = 0;
    
    self.tipSlider.continuous = YES;
    [self.tipSlider addTarget:self
               action:@selector(valueChanged:)
     forControlEvents:UIControlEventValueChanged];
}

- (void)valueChanged:(UISlider *)sender {
    NSUInteger index = (NSUInteger)(self.tipSlider.value + 0.5);
    [self.tipSlider setValue:index animated:NO];
    NSNumber *number = self.sliderValues[index];
    
    self.tipAmountToBePassed = number;
    
    int showTip = [self.totalBill floatValue] / [number floatValue];
    self.tipAmountLabel.text = [NSString stringWithFormat:@"Tip %@: $%i", number, showTip];
    
    NSLog(@"sliderIndex: %i", (int)index);
    NSLog(@"number: %@", number);
}

@end
