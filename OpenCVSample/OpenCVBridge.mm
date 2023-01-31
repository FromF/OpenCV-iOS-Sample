//
//  OpenCVBridge.cpp
//  OpenCVSample
//
//  Created by 藤治仁 on 2023/01/31.
//

#import "opencv2/opencv.hpp"
#import "opencv2/imgproc.hpp"
#import "opencv2/imgcodecs.hpp"
#import "opencv2/imgcodecs/ios.h"
#import "OpenCVBridge.h"

@implementation OpenCVBridge
+ (nullable UIImage *)filteredImage
{
    UIImage *srcImage = [UIImage imageNamed:@"sampleImage"];
    cv::Mat srcImageMat;
    cv::Mat dstImageMat;
    
    // UIImageからcv::Matに変換する
    UIImageToMat(srcImage, srcImageMat);
    
    // 色空間をRGBからGrayに変換する
    cv::cvtColor(srcImageMat, dstImageMat, cv::COLOR_RGB2GRAY);
    
    // cv::MatをUIImageに変換する
    UIImage *dstImage = MatToUIImage(dstImageMat);
    
    return dstImage;
}
@end
