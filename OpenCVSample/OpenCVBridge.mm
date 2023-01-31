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

#import "opencv2/video.hpp"
#import "opencv2/videoio.hpp"


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

+ (nullable UIImage *)captureOneShot
{
    // https://docs.opencv.org/4.x/d8/dfe/classcv_1_1VideoCapture.html
    // 上記リファレンスマニュアルあるサンプルコードをベースに作成
    
    cv::Mat frame;
    cv::VideoCapture cap;
    
    cap.open("rtsp://192.168.80.50/MediaInput/h264");
    if(cap.isOpened() == FALSE){
        NSLog(@"ERROR! Unable to open camera");
        cap.release();
        return nil;
    }

    cap.read(frame);
    if (frame.empty() == true) {
        NSLog(@"ERROR! blank frame grabbed");
        cap.release();
        return nil;
    }
    UIImage *dstImage = MatToUIImage(frame);
    cap.release();
    
    return  dstImage;
}

@end
