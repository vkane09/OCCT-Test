
// OCCT
#include <TDocStd_Application.hxx>
#include <TDataStd_Integer.hxx>
#include <BinDrivers.hxx>


void ThrowException(std::string msg)
{
	throw std::exception(msg.c_str());
}

int main()
{
	Handle(TDocStd_Application)
		app = new TDocStd_Application;

	BinDrivers::DefineFormat(app);

	Handle(TDocStd_Document) doc;
	app->NewDocument("BinOcaf", doc);
	if(doc.IsNull())
	{
		ThrowException("ERROR: Cannot create document.");
	}

	auto mainLab = doc->Main();

	TDataStd_Integer::Set(mainLab, 199);


	auto status = app->SaveAs(doc, "test.cbf");

	if(PCDM_SS_OK != status)
	{
		ThrowException("ERROR: Failed to write Ocaf document");
	}

	app->Close(doc);
	return 0;
}
