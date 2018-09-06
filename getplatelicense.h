#ifndef GETPLATELICENSE_H
#define GETPLATELICENSE_H

#endif // GETPLATELICENSE_H

#include<QObject>
#include<easypr.h>
#include<QVector>
#include<memory.h>
using namespace easypr;

class PlateLicense:public QObject

{
    Q_OBJECT
    Q_PROPERTY(QString imgurl READ imgurl WRITE setImgurl NOTIFY urlchange)
    Q_PROPERTY(QVector<QString> plates READ plates)

signals:
    void urlchange();
    void plateschange();

public:
    explicit PlateLicense(QObject *parent=0);
    QString imgurl();
    void setImgurl(QString &imgurl);
    QVector<QString> plates();
    Q_INVOKABLE void setPlates();
private:
    CPlateRecognize pr;
    QString myimgurl;
    QVector<QString> myplates;
};
