//
//  GTDetailViewController.m
//  SampleApp
//
//  Created by 王韬 on 2020/11/9.
//

#import "GTDetailViewController.h"
#import <WebKit/WebKit.h>
#import "GTMediator.h"

@interface GTDetailViewController ()<WKNavigationDelegate>
@property (nonatomic, strong, readwrite) WKWebView *webView;
@property (nonatomic, strong, readwrite) UIProgressView *progressView;
@property (nonatomic, copy, readwrite) NSString *articleUrl;
@end

@implementation GTDetailViewController

+ (void)load{
//    [GTMediator registerScheme:@"detail://" processBlock:^(NSDictionary * _Nonnull params) {
//        NSString *url = [params objectForKey:@"url"];
//        UINavigationController *navi = (UINavigationController *)[params objectForKey:@"controller"];
//        GTDetailViewController *controller = [[GTDetailViewController alloc] initWithUrlSting:url];
//        [navi pushViewController:controller animated:YES];
//    }];
    [GTMediator registerProtol:@protocol(GTDetailViewControllerProtocol) class:[self class]];
}



- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

-(instancetype)initWithUrlSting:(NSString *)urlString{
    self = [super init];
    if (self) {
        self.articleUrl = urlString;
    }
    return self;
}

- (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl{
    return [[[self class] alloc] initWithUrlSting:detailUrl];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:({
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88)];
        self.webView.navigationDelegate = self;
        self.webView;
    })];

    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 20)];
        self.progressView;
    })];

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.articleUrl]]];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context {
    self.progressView.progress = self.webView.estimatedProgress;
   
    if (self.webView.estimatedProgress == 1) {
        [_progressView removeFromSuperview];
    }
}

@end
