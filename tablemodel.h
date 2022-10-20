#ifndef TABLEMODEL_H
#define TABLEMODEL_H

#include <QObject>
#include <QVariantList>

class TableModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList<QVariant> testdata READ getData NOTIFY newdataUpdated)
public:
    explicit TableModel(QObject *parent = nullptr);
    QList<QVariant> getData(){ return data;}

signals:
    void newdataUpdated();
private:
   QList<QVariant> data;

};

#endif // TABLEMODEL_H
