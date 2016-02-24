//
//  ViewController.m
//  sectionList
//
//  Created by smc on 16/2/23.
//  Copyright © 2016年 smc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WFSSelectionList *scrollView = [[WFSSelectionList alloc] initWithFrame:CGRectMake(10, 100, 320, 40)];
    scrollView.contentSize = CGSizeMake(500, 40);
    scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNavigationBar
{
    
//    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH,44)];
//    self.bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH-100, 44)];
//    self.bgScrollView.contentSize =CGSizeMake(VIEW_WIDTH, 44);
//    self.bgScrollView.delaysContentTouches = NO;
//    self.bgScrollView.showsHorizontalScrollIndicator = NO;
//    [titleView addSubview:self.bgScrollView];
//    for (int i=0; i<6; i++)
//    {
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        btn.frame = CGRectMake(i*61, 10, 61, 28);
//        switch (i) {
//            case 0:
//            {
//                [btn setTitle:@"推荐" forState:0];
//                btn.selected = YES;
//            }
//                break;
//            case 1:
//                [btn setTitle:@"直播" forState:0];
//                break;
//            case 2:
//                [btn setTitle:@"FM" forState:0];
//                break;
//            case 3:
//                [btn setTitle:@"电视剧" forState:0];
//                break;
//            case 4:
//                [btn setTitle:@"影视" forState:0];
//                break;
//            case 5:
//                [btn setTitle:@"动漫" forState:0];
//                break;
//            default:
//                break;
//        }
//        
//        [btn addTarget:self action:@selector(naviBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [btn setTitleColor:[UIColor whiteColor] andSelectedTitleColor:color0105 andfond:14];
//        UIImageView *subImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"choose"]];
//        [subImage setFrame:CGRectMake(i*61, 38, 61, 6)];
//        [self.bgScrollView addSubview:subImage];
//        [self.bgScrollView addSubview:btn];
//        btn.tag =i+10;//btn的tag
//        subImage.tag = i+50;//下划线tag
//        subImage.hidden = !btn.selected;
//    }
//    UIButton *signBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIButton *searchBtn =[UIButton buttonWithType:UIButtonTypeCustom];
//    [signBtn setImage:@"channel_botton" andSelectedImage:@"channel_botton_selected"];
//    [searchBtn setImage:[UIImage imageNamed:@"search_botton"] forState:0];
//    [signBtn setFrame:CGRectMake(VIEW_WIDTH-100, 5, 37.5, 40)];
//    [searchBtn setFrame:CGRectMake(VIEW_WIDTH-47.5, 5, 37.5, 40)];
//    [signBtn addTarget:self action:@selector(SignBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [searchBtn addTarget:self action:@selector(searchBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [titleView addSubview:signBtn];
//    [titleView addSubview:searchBtn];
//    self.navigationItem.titleView =titleView;
//    [self.navigationItem.titleView setFrame:CGRectMake(0, 0, VIEW_WIDTH, 44)];
}

@end
