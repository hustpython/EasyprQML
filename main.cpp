#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <easyprsource/include/easypr.h>
#include <getplatelicense.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlRegisterType<PlateLicense>("com.mxq.easypr",1,0,"PlateLicense");
    QQmlApplicationEngine engine;
    //app.setWindowIcon("myappico.ico");
    engine.load(QUrl(QStringLiteral("qrc:/main/Main.qml")));
    //view.setSourceAndRegsiterObj(QUrl::fromLocalFile("Main.qml"));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
