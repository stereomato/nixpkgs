{
  lib,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
  poetry-core,
  aenum,
  aioconsole,
  aiohttp,
  inflection,
  pydantic,
  python-dateutil,
  typing-extensions,
  urllib3,
  websockets,
  zeroconf,
}:

buildPythonPackage rec {
  pname = "mozart-api";
  version = "4.1.1.116.5";
  pyproject = true;

  disabled = pythonOlder "3.11";

  src = fetchPypi {
    pname = "mozart_api";
    inherit version;
    hash = "sha256-4ALRG0yKCRwztQ9A6fMVaht6c8tDrMSh+CfsLRZbdcw=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    aenum
    aioconsole
    aiohttp
    inflection
    pydantic
    python-dateutil
    typing-extensions
    urllib3
    websockets
    zeroconf
  ];

  # Package has no tests
  doCheck = false;

  pythonImportsCheck = [ "mozart_api" ];

  meta = {
    description = "REST API for the Bang & Olufsen Mozart platform";
    homepage = "https://github.com/bang-olufsen/mozart-open-api";
    changelog = "https://github.com/bang-olufsen/mozart-open-api/releases/tag/${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ pyrox0 ];
  };
}
