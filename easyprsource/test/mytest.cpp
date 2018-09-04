#include <easypr.h>
#include <ctime>
#include <fstream>
#include <list>
#include <memory>
#include <numeric>
#include <unordered_map>
#include "easypr/core/core_func.h"
#include "easypr/util/util.h"
#include "thirdparty/xmlParser/xmlParser.h"
#include "easypr/core/params.h"
#include <iostream>
#include "config.hpp"
#include "result.hpp"
using namespace easypr;

int main()
{
    CPlateRecognize pr;
	pr.setResultShow(false);
	pr.setDetectType(PR_DETECT_CMSER);
     
	vector<CPlate> plateVec;
	Mat src = imread("test.jpeg");
	//std::cout<<src<<std::endl;
	int result = pr.plateRecognize(src, plateVec);

	if(result != 0)
	{
		exit(-1);
	}
	for(int i=0;i<plateVec.size();i++)
	{
		CPlate plate = plateVec.at(i);
		Mat plateMat = plate.getPlateMat();
		RotatedRect rrect = plate.getPlatePos();
		string license = plate.getPlateStr();
		std::cout<<license<<std::endl;
	}

    return 0;
}