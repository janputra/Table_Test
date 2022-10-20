#include "tablemodel.h"

TableModel::TableModel(QObject *parent)
    : QObject{parent}
{

    data.append(QStringList{"test1","value1"});
    data.append(QStringList{"test2","value2"});
    data.append(QStringList{"test3","value3"});

}
