#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    //app.setWindowIcon(QIcon("qrc:/ico/ico.ico"));
    engine.load(QUrl(QStringLiteral("qrc:/main/Main.qml")));
    //view.setSourceAndRegsiterObj(QUrl::fromLocalFile("Main.qml"));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
