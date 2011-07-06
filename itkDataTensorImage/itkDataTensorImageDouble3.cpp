// /////////////////////////////////////////////////////////////////
// Generated by dtkPluginGenerator
// /////////////////////////////////////////////////////////////////

#include "itkDataTensorImageDouble3.h"

#include <dtkCore/dtkAbstractDataFactory.h>

#include <itkTensor.h>
#include <itkImage.h>
#include <itkImageRegionConstIterator.h>
#include <itkImageRegionIteratorWithIndex.h>
#include <itkImageFileWriter.h>
#include <itkVectorImage.h>
#include <itkVector.h>


// /////////////////////////////////////////////////////////////////
// itkDataTensorImagePrivate
// /////////////////////////////////////////////////////////////////

class itkDataTensorImageDouble3Private
{
public:
    typedef itk::Tensor<double, 3>    TensorType;
    typedef itk::Image<TensorType, 3> TensorImageType;
  
    TensorImageType::Pointer tensors;

    QImage        thumbnail;
    QList<QImage> thumbnails;
};

// /////////////////////////////////////////////////////////////////
// itkDataTensorImage
// /////////////////////////////////////////////////////////////////

itkDataTensorImageDouble3::itkDataTensorImageDouble3(void) : medAbstractDataTypedImage<3,double>(), d(new itkDataTensorImageDouble3Private)
{
    d->tensors = 0;
    d->thumbnail = QImage(":/itkDataTensorImage/icons/tensors.png");
    d->thumbnails << d->thumbnail;
}

itkDataTensorImageDouble3::~itkDataTensorImageDouble3(void)
{
    delete d;
    d = 0;
}

bool itkDataTensorImageDouble3::registered(void)
{
    return dtkAbstractDataFactory::instance()->registerDataType("itkDataTensorImageDouble3", createItkDataTensorImageDouble3);
}

QString itkDataTensorImageDouble3::description(void) const
{
    return "itkDataTensorImageDouble3";
}

void *itkDataTensorImageDouble3::data(void)
{
    return d->tensors.GetPointer();
}

void *itkDataTensorImageDouble3::output(void)
{
    return d->tensors.GetPointer();
}

void itkDataTensorImageDouble3::setData(void *data)
{
    typedef itkDataTensorImageDouble3Private::TensorImageType TensorImageType;

    if( TensorImageType* tensors = dynamic_cast<TensorImageType*>( (itk::Object*)(data) ) ){
        d->tensors = tensors;
    }
    else
      qDebug() << "Cannot cast pointer to correct tensor type";
}

int itkDataTensorImageDouble3::xDimension (void)
{
    if (!d->tensors.IsNull())
      return d->tensors->GetLargestPossibleRegion().GetSize()[0];
    return -1;
}

int itkDataTensorImageDouble3::yDimension (void)
{
    if (!d->tensors.IsNull())
        return d->tensors->GetLargestPossibleRegion().GetSize()[1];
    return -1;
}

int itkDataTensorImageDouble3::zDimension (void)
{
    if (!d->tensors.IsNull())
        return d->tensors->GetLargestPossibleRegion().GetSize()[2];
    return -1;
}

QImage& itkDataTensorImageDouble3::thumbnail  (void) const
{
    // TODO: TEMPORARY black image just to allow drag and drop
    return d->thumbnail;
}

QList<QImage>& itkDataTensorImageDouble3::thumbnails (void) const
{
    return d->thumbnails;
}

// /////////////////////////////////////////////////////////////////
// Type instantiation
// /////////////////////////////////////////////////////////////////

dtkAbstractData *createItkDataTensorImageDouble3(void)
{
    return new itkDataTensorImageDouble3;
}
