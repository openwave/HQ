
C:\sphinx\bin\indexer.exe --config D:\HQ\config\development.sphinx.conf org_core

pause

C:\sphinx\bin\indexer.exe --config D:\HQ\config\development.sphinx.conf org_delta

pause

C:\sphinx\bin\searchd.exe --install --config D:\HQ\config\development.sphinx.conf --servicename HqSearch

pause