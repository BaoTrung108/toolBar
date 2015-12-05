//
//  ViewController.m
//  toolBar
//
//  Created by trung bao on 05/12/2015.
//  Copyright © 2015 baotrung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@end

@implementation ViewController {
    UIScrollView* scrollview;
    UIImageView* images;
    UINavigationBar* narBar;
    UIToolbar* toolBar;
    UISlider* slider;
    UILabel* laber1,*laber2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    images = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"images"]];
    narBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, narBar.bounds.size.width,narBar.bounds.size.height)];
    [narBar sizeToFit];
    narBar.barStyle = UIBarStyleDefault;
    narBar.backgroundColor = [UIColor grayColor];
    laber1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, narBar.bounds.size.width - 50, narBar.bounds.size.height - 15)];
    laber1.text = @"Giá trị Scale";
    laber2 = [[UILabel alloc] initWithFrame:CGRectMake(narBar.bounds.size.width-50, 15, 50, narBar.bounds.size.height - 15)];
    laber2.text = @"4.00";
    [narBar addSubview:laber1];
    [narBar addSubview:laber2];
    toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, narBar.bounds.size.height, toolBar.bounds.size.width , toolBar.bounds.size.height)];
    [toolBar sizeToFit];
    toolBar.barStyle = UIBarStyleDefault;
    slider = [[UISlider alloc] initWithFrame:CGRectMake(10, narBar.bounds.size.width + toolBar.bounds.size.width* 0.5, toolBar.bounds.size.width -20 , 40)];
    slider.maximumValue = 4.0;
    slider.minimumValue = 0.2;
    slider.value = 4.0;
    [slider addTarget:self
               action:@selector(slidevalue:)
     forControlEvents:UIControlEventValueChanged];
    toolBar.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem* toolbarButton = [[UIBarButtonItem alloc] initWithCustomView:slider];
    toolBar.items = @[toolbarButton];
    scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, narBar.bounds.size.height + toolBar.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height - (narBar.bounds.size.height + toolBar.bounds.size.height))];
    [scrollview addSubview:images];
    scrollview.maximumZoomScale = slider.maximumValue;
    scrollview.minimumZoomScale = slider.minimumValue;
    scrollview.delegate = self;
    [self.view addSubview:toolBar];
    [self.view addSubview:narBar];
    [self.view addSubview:scrollview];
    
}

- (void) slidevalue: (UISlider*) sliderchange {
    [scrollview setZoomScale:sliderchange.value
                    animated:YES];
}
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return images;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    slider.value = scrollview.zoomScale;
    laber2.text = [NSString stringWithFormat:@"%2.2f",slider.value];
}
@end
