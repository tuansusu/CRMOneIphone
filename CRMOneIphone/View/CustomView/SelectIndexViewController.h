//
//  SelectIndexViewController.h
//  CRMOneIphone
//
//  Created by viettel on 2/18/15.
//  Copyright (c) 2015 com.viettel. All rights reserved.
//

#import "BaseViewController.h"

@protocol SelectIndexDelegate <NSObject>
@optional
-(void) selectAtIndex : (NSInteger) index;
@end

@interface SelectIndexViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tbData;
@property (weak,nonatomic) id <SelectIndexDelegate> delegate;
@property (nonatomic) NSInteger selectIndex;
@property (nonatomic, retain) NSArray *listData;
@property (nonatomic) BOOL isChecked;

@end
