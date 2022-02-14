#include <QApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include "process.h"
#include "managerqml.h"
#include <QQmlContext>


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url("qrc:/qml/main.qml");
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    QQmlContext *context = engine.rootContext();
    context->setContextProperty("ManagerQML", MANAGERQML);
    context->setContextProperty("Process", PROCESS);


    engine.load(url);

    return app.exec();
}
