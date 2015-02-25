//
//  SelectAddInMapsViewController.h
//  CRMOneIphone
//
//  Created by viettel on 2/23/15.
//  Copyright (c) 2015 com.viettel. All rights reserved.
//

#import "BaseViewController.h"
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface SelectAddInMapsViewController : BaseViewController<UISearchBarDelegate, UISearchDisplayDelegate>

@property (strong, nonatomic) IBOutlet UIView *view;

@property (weak, nonatomic) IBOutlet UISearchBar *txtSearchBar;
@property (weak, nonatomic) IBOutlet MKMapView *mkMapview;

@end
