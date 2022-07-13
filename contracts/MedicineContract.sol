// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract MedicineContract {

   struct medicine {  
        string medicineName;
        string manufacturingCompany;
        string manufacturingPlace;
        uint expiryDate;
        string precautions;
        string chemicalComosition;
        uint warehouseId;
        uint warehouseReceivedDate;
        string distributorId;
        string distributorReceivedDate;
        string shopId;
        string shopReceivedDate;
        string customerSSN;
        string customerReceivedDate;
    }


    mapping (uint => medicine ) m_info;
    mapping(uint=> uint) getMedicineIdFromWarehouseId;
    mapping(uint=> uint) getMedicineIdFromDistributorId;
    mapping(uint=> uint) getMedicineIdFromShopId;
    mapping(uint=> uint) getMedicineIdFromCustomerSSN;

    function addMedicineInfo (uint _medicineId, string memory _medicineName, 
                    string memory _manufacturingCompany,string memory _manufacturingPlace ,
                    uint _expiryDate , string memory  _precautions,
                    string memory _chemicalComosition) public  {
        
    m_info[_medicineId].medicineName=_medicineName;
    m_info[_medicineId].manufacturingCompany=_manufacturingCompany;
    m_info[_medicineId].manufacturingPlace=_manufacturingPlace;
    m_info[_medicineId].expiryDate=_expiryDate;
    m_info[_medicineId].precautions=_precautions;
    m_info[_medicineId].chemicalComosition=_chemicalComosition;
    }

function getMedicineInfo(uint  _medicineId) public view returns(string memory medicineName,
    string memory manufacturingCompany,string memory  manufacturingPlace ,
    uint expiryDate , string memory precautions, string memory chemicalComosition//,
    //string memory warehouseReceivedDate ,string memory distributorReceivedDate ,
    //string memory shopReceivedDate ,string memory customerReceivedDate
    ){
        return(m_info[_medicineId].medicineName,
         m_info[_medicineId].manufacturingCompany,
         m_info[_medicineId].manufacturingPlace,
         m_info[_medicineId].expiryDate,
         m_info[_medicineId].precautions,
        m_info[_medicineId].chemicalComosition//,
         //m_info[_medicineId].warehouseReceivedDate, 
        // m_info[_medicineId].distributorReceivedDate,
        // m_info[_medicineId].shopReceivedDate,
        //  m_info[_medicineId].customerReceivedDate
        );
    }
    
    function UpdatePrecautions( uint _medicineId,string memory  _precautions ) public {
        m_info[_medicineId].precautions = _precautions;
    }

    function UpdateWarehouseDetails( uint _medicineId,uint  _warehouseId ) public {
        m_info[_medicineId].warehouseId=_warehouseId;
        m_info[_medicineId].warehouseReceivedDate = block.timestamp;
        getMedicineIdFromWarehouseId[_warehouseId]=_medicineId;
    }

function getWarehouseDetails(uint  _warehouseId) public view returns(string memory medicineName,
    string memory manufacturingCompany,string memory  manufacturingPlace ,
    uint expiryDate , string memory precautions, string memory chemicalComosition,
    uint warehouseReceivedDate
    ){
        uint _medicineId=getMedicineIdFromWarehouseId[_warehouseId];
        return(m_info[_medicineId].medicineName,
         m_info[_medicineId].manufacturingCompany,
         m_info[_medicineId].manufacturingPlace,
         m_info[_medicineId].expiryDate,
         m_info[_medicineId].precautions,
        m_info[_medicineId].chemicalComosition,
         m_info[_medicineId].warehouseReceivedDate
        );
    }

    function UpdateDistributorDetails( uint _medicineId,uint _distributorId ) public {
        m_info[_medicineId].distributorId=string(new bytes(_distributorId));
        m_info[_medicineId].distributorReceivedDate = string(new bytes(block.timestamp));
        getMedicineIdFromDistributorId[_distributorId]=_medicineId;
    }
    function UpdateShopDetails( uint _medicineId,uint _shopId ) public {
        m_info[_medicineId].shopId=string(new bytes(_shopId));
        m_info[_medicineId].shopReceivedDate = string(new bytes(block.timestamp));
        getMedicineIdFromShopId[_shopId]=_medicineId;
    }

    function UpdateCustomerDetails( uint _medicineId,uint _customerSSN) public {
        m_info[_medicineId].customerSSN=string(new bytes(_customerSSN));
        m_info[_medicineId].customerReceivedDate = string(new bytes(block.timestamp));
        getMedicineIdFromCustomerSSN[_customerSSN]=_medicineId;
    }

}

