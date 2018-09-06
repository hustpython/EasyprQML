#include<getplatelicense.h>
#include <string.h>

PlateLicense::PlateLicense(QObject *parent)
{

}

QString PlateLicense::imgurl()
{
    return myimgurl;
}
void PlateLicense::setImgurl(QString &imgurl)
{
    if (myimgurl != imgurl)
        {
           myimgurl = imgurl;
           emit setPlates();
        }
}
QVector<QString> PlateLicense::plates()
{
    return myplates;
}
void PlateLicense::setPlates()
{
    myplates.clear();
    //myplates = "京";
    CPlateRecognize pr;
    pr.setResultShow(false);
    pr.setDetectType(PR_DETECT_CMSER);

    vector<CPlate> plateVec;
    string strimg,substrimg;
    strimg = myimgurl.toStdString();
    substrimg = strimg.substr(7,strimg.length());
    std::cout << substrimg<<std::endl;
    Mat src = imread(substrimg);
    //std::cout<<src<<std::endl;
    int result = pr.plateRecognize(src, plateVec);

    if(result != 0)
    {
        exit(-1);
    }
    string license;
    for(int i=0;i<plateVec.size();i++)
    {
        CPlate plate = plateVec.at(i);
        //Mat plateMat = plate.getPlateMat();
        //RotatedRect rrect = plate.getPlatePos();
        license = plate.getPlateStr();
        myplates.append(QString::fromStdString(license));
    }
    emit plateschange();
}


