//
//  ViewController.m
//  Eula-Sample-Application
//
//  Created by Adam Cooper on 8/21/16.
//  Copyright © 2016 Adam Cooper. All rights reserved.
//

#import "ViewController.h"
#import <Eula/Eula.h>

@interface ViewController ()

@property (nonatomic, strong) UIButton *showTermsOfServiceButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.showTermsOfServiceButton];
    [self setupConstraints];
}

#pragma mark - Actions

- (void)onShowTermsOfServiceButtonPressed:(UIButton *)sender
{
    UIViewController *termsOfServiceViewController = [ELAManager termsOfServiceViewController];
    [self.navigationController pushViewController:termsOfServiceViewController animated:YES];
}

#pragma mark - Properties

- (UIButton *)showTermsOfServiceButton
{
    if (!_showTermsOfServiceButton)
    {
        _showTermsOfServiceButton = [[UIButton alloc] init];
        _showTermsOfServiceButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_showTermsOfServiceButton setTitle:@"Show Terms" forState:UIControlStateNormal];
        [_showTermsOfServiceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_showTermsOfServiceButton addTarget:self action:@selector(onShowTermsOfServiceButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _showTermsOfServiceButton;
}

#pragma mark - Constraints

- (void)setupConstraints
{
    //Show Terms of Service Button Constraints
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.showTermsOfServiceButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.showTermsOfServiceButton attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.showTermsOfServiceButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:52.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.showTermsOfServiceButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    
    [self.view layoutIfNeeded];

}

@end
