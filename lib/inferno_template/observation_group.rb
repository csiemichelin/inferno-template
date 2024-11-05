module InfernoTemplate
  class ObservationGroup < Inferno::TestGroup
    title 'Observation(觀察的測量結果) Tests'
    description 'Verify that the server makes Observation resources available'
    id :observation_group

    input_order :url, :observation_id, :observation_category, :observation_code, :observation_performer, :observation_status, :observation_subject, :observation_date, :observation_patient, :observation_lastUpdated, :observation_resource

    # 建議應該（SHOULD） 支援透過查詢參數 _id 查詢所有Observation：
    test do
      title '[GET] Server returns valid results for Observation search by _id'
      description %(
        A server SHALL support searching by _id on the Observation resource. This test will pass if resources are returned and match the search criteria. If none are returned, the test is skipped.

        Because this is the first search of the sequence, resources in the response will be used for subsequent tests.

        Additionally, this test will check that GET and POST search methods return the same number of results. Search by POST is required by the FHIR R4 specification, and these tests interpret search by GET as a requirement of TW Core v0.3.1.

        [臺灣核心-實驗室檢驗檢查（TW Core Observation Laboratory Result）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-laboratoryResult-twcore.html)

        [臺灣核心-生命體徵（TW Core Observation Vital Signs）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-vitalSigns-twcore.html)

        [臺灣核心-血壓（TW Core Observation Blood Pressure）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bloodPressure-twcore.html)

        [臺灣核心-身體質量指數（TW Core Observation BMI）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bmi-twcore.html)
      )

      # 讓 url開頭
      input_order :url

      input :observation_id,
        title: 'Observation _id',
        default: '15886'

      # Named requests can be used by other tests
      makes_request :observation

      run do
        fhir_search('Observation', params: { _id: observation_id }, name: :observation)

        assert_response_status(200)
        assert_resource_type('Bundle')
      end
    end

    # 建議應該（SHOULD） 支援透過查詢參數 category 查詢所有Observation：
    test do
      title '[GET] Server returns valid results for Observation search by category'
      description %(
        A server SHALL support searching by category on the Observation resource. This test will pass if resources are returned and match the search criteria. If none are returned, the test is skipped.

        Because this is the first search of the sequence, resources in the response will be used for subsequent tests.

        Additionally, this test will check that GET and POST search methods return the same number of results. Search by POST is required by the FHIR R4 specification, and these tests interpret search by GET as a requirement of TW Core v0.3.1.

        [臺灣核心-實驗室檢驗檢查（TW Core Observation Laboratory Result）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-laboratoryResult-twcore.html)

        [臺灣核心-生命體徵（TW Core Observation Vital Signs）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-vitalSigns-twcore.html)

        [臺灣核心-血壓（TW Core Observation Blood Pressure）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bloodPressure-twcore.html)

        [臺灣核心-身體質量指數（TW Core Observation BMI）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bmi-twcore.html)
      )

      input_order :url

      input :observation_category,
        title: 'Observation category',
        default: 'vital-signs'

      run do
        fhir_search('Observation', params: { category: observation_category })

        assert_response_status(200)
        assert_resource_type('Bundle')
      end
    end

    # 建議應該（SHOULD） 支援透過查詢參數 code 查詢所有Observation：
    test do
      title '[GET] Server returns valid results for Observation search by code'
      description %(
        A server SHALL support searching by code on the Observation resource. This test will pass if resources are returned and match the search criteria. If none are returned, the test is skipped.

        Because this is the first search of the sequence, resources in the response will be used for subsequent tests.

        Additionally, this test will check that GET and POST search methods return the same number of results. Search by POST is required by the FHIR R4 specification, and these tests interpret search by GET as a requirement of TW Core v0.3.1.

        [臺灣核心-實驗室檢驗檢查（TW Core Observation Laboratory Result）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-laboratoryResult-twcore.html)

        [臺灣核心-生命體徵（TW Core Observation Vital Signs）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-vitalSigns-twcore.html)

        [臺灣核心-血壓（TW Core Observation Blood Pressure）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bloodPressure-twcore.html)

        [臺灣核心-身體質量指數（TW Core Observation BMI）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bmi-twcore.html)
      )

      input :observation_code,
        title: 'Observation code',
        default: '29463-7'

      run do
        fhir_search('Observation', params: { code: observation_code })

        assert_response_status(200)
        assert_resource_type('Bundle')
      end
    end

    # 建議應該（SHOULD） 支援透過查詢參數 performer 查詢所有Observation：
    test do
      title '[GET] Server returns valid results for Observation search by performer'
      description %(
        A server SHALL support searching by performer on the Observation resource. This test will pass if resources are returned and match the search criteria. If none are returned, the test is skipped.

        Because this is the first search of the sequence, resources in the response will be used for subsequent tests.

        Additionally, this test will check that GET and POST search methods return the same number of results. Search by POST is required by the FHIR R4 specification, and these tests interpret search by GET as a requirement of TW Core v0.3.1.

        [臺灣核心-實驗室檢驗檢查（TW Core Observation Laboratory Result）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-laboratoryResult-twcore.html)

        [臺灣核心-生命體徵（TW Core Observation Vital Signs）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-vitalSigns-twcore.html)

        [臺灣核心-血壓（TW Core Observation Blood Pressure）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bloodPressure-twcore.html)

        [臺灣核心-身體質量指數（TW Core Observation BMI）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bmi-twcore.html)
      )

      input_order :url

      input :observation_performer,
        title: 'Observation performer',
        default: 'Organization/org-nsysu'

      run do
        fhir_search('Observation', params: { performer: observation_performer })

        assert_response_status(200)
        assert_resource_type('Bundle')
      end
    end

    # 建議應該（SHOULD） 支援透過查詢參數 status 查詢所有Observation：
    test do
      title '[GET] Server returns valid results for Observation search by status'
      description %(
        A server SHALL support searching by status on the Observation resource. This test will pass if resources are returned and match the search criteria. If none are returned, the test is skipped.

        Because this is the first search of the sequence, resources in the response will be used for subsequent tests.

        Additionally, this test will check that GET and POST search methods return the same number of results. Search by POST is required by the FHIR R4 specification, and these tests interpret search by GET as a requirement of TW Core v0.3.1.

        [臺灣核心-實驗室檢驗檢查（TW Core Observation Laboratory Result）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-laboratoryResult-twcore.html)

        [臺灣核心-生命體徵（TW Core Observation Vital Signs）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-vitalSigns-twcore.html)

        [臺灣核心-血壓（TW Core Observation Blood Pressure）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bloodPressure-twcore.html)

        [臺灣核心-身體質量指數（TW Core Observation BMI）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bmi-twcore.html)
      )

      input_order :url

      input :observation_status,
        title: 'Observation status',
        default: 'final'

      run do
        fhir_search('Observation', params: { status: observation_status })

        assert_response_status(200)
        assert_resource_type('Bundle')
      end
    end

    # 建議應該（SHOULD） 支援透過查詢參數 subject 查詢所有Observation：
    test do
      title '[GET] Server returns valid results for Observation search by subject'
      description %(
        A server SHALL support searching by subject on the Observation resource. This test will pass if resources are returned and match the search criteria. If none are returned, the test is skipped.

        Because this is the first search of the sequence, resources in the response will be used for subsequent tests.

        Additionally, this test will check that GET and POST search methods return the same number of results. Search by POST is required by the FHIR R4 specification, and these tests interpret search by GET as a requirement of TW Core v0.3.1.

        [臺灣核心-實驗室檢驗檢查（TW Core Observation Laboratory Result）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-laboratoryResult-twcore.html)

        [臺灣核心-生命體徵（TW Core Observation Vital Signs）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-vitalSigns-twcore.html)

        [臺灣核心-血壓（TW Core Observation Blood Pressure）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bloodPressure-twcore.html)

        [臺灣核心-身體質量指數（TW Core Observation BMI）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bmi-twcore.html)
      )

      input_order :url

      input :observation_subject,
        title: 'Observation subject',
        default: 'Patient/pat-nsysu-hd-001'

      run do
        fhir_search('Observation', params: { subject: observation_subject })

        assert_response_status(200)
        assert_resource_type('Bundle')
      end
    end

    # 建議應該（SHOULD） 支援透過查詢參數 date 查詢所有Observation：
    test do
      title '[GET] Server returns valid results for Observation search by date'
      description %(
        A server SHALL support searching by date on the Observation resource. This test will pass if resources are returned and match the search criteria. If none are returned, the test is skipped.

        Because this is the first search of the sequence, resources in the response will be used for subsequent tests.

        Additionally, this test will check that GET and POST search methods return the same number of results. Search by POST is required by the FHIR R4 specification, and these tests interpret search by GET as a requirement of TW Core v0.3.1.

        [臺灣核心-實驗室檢驗檢查（TW Core Observation Laboratory Result）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-laboratoryResult-twcore.html)

        [臺灣核心-生命體徵（TW Core Observation Vital Signs）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-vitalSigns-twcore.html)

        [臺灣核心-血壓（TW Core Observation Blood Pressure）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bloodPressure-twcore.html)

        [臺灣核心-身體質量指數（TW Core Observation BMI）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bmi-twcore.html)
      )

      input_order :url

      input :observation_date,
        title: 'Observation date',
        default: 'gt2022-04-01'

      run do
        fhir_search('Observation', params: { date: observation_date })

        assert_response_status(200)
        assert_resource_type('Bundle')
      end
    end

    # 驗證查詢 _id 的 Observation resource 是否合規
    test do
      title '[GET] Observation resource is valid'
      description %(
        Verify that the Observation resource search by _id returned from the server is a valid FHIR resource.

        * Verifying the HTTP status code of a response.
        
        * Verifying that a string is valid JSON.
        
        * Validating a FHIR Resource.

        [臺灣核心-實驗室檢驗檢查（TW Core Observation Laboratory Result）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-laboratoryResult-twcore.html)

        [臺灣核心-生命體徵（TW Core Observation Vital Signs）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-vitalSigns-twcore.html)

        [臺灣核心-血壓（TW Core Observation Blood Pressure）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bloodPressure-twcore.html)

        [臺灣核心-身體質量指數（TW Core Observation BMI）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bmi-twcore.html)
      )
      # This test will use the response from the :observation request in the
      # previous test
      uses_request :observation

      run do
        assert_response_status(200)
        assert_resource_type('Bundle')
        assert_valid_resource
      end
    end

    # 必須（SHALL） 支援透過查詢參數 patient 及 category 查詢所有Observation：
    test do
      title '[GET] Server returns valid results for Observation search by patient and category'
      description %(
        A server SHALL support searching by patient and category on the Observation resource. This test will pass if resources are returned and match the search criteria. If none are returned, the test is skipped.

        Because this is the first search of the sequence, resources in the response will be used for subsequent tests.

        Additionally, this test will check that GET and POST search methods return the same number of results. Search by POST is required by the FHIR R4 specification, and these tests interpret search by GET as a requirement of TW Core v0.3.1.

        [臺灣核心-平均血壓（TW Core Observation Average Blood Pressure）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-averageBloodPressure-twcore.html)

        [臺灣核心-病人照護偏好註記（TW Core Observation Care Experience Preference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-careExperiencePreference-twcore.html)

        [臺灣核心-臨床檢驗檢查（TW Core Observation Clinical Result）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-clinical-result-twcore.html)

        [臺灣核心-職業（TW Core Observation Occupation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-occupation-twcore.html)

        [臺灣核心-妊娠計畫（TW Core Observation Pregnancy Intent）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pregnancy-intent-twcore.html)

        [臺灣核心-妊娠狀態（TW Core Observation Pregnancy Status）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pregnancy-status-twcore.html)

        [臺灣核心-健康狀態篩檢與評估（TW Core Observation Screening Assessment）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-screening-assessment-twcore.html)

        [臺灣核心-性傾向（TW Core Observation Sexual Orientation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-sexual-orientation-twcore.html)

        [臺灣核心-通用檢驗檢查（TW Core Simple Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-simple-twcore.html)

        [臺灣核心-吸菸狀態（TW Core Observation Smoking Status）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-smoking-status-twcore.html)

        [臺灣核心-病人治療偏好註記（TW Core Observation Treatment Intervention Preference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-treatment-intervention-preference-twcore.html)

        [臺灣核心-兒童及青少年身體質量指數（TW Core Pediatric BMI for Age Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-bmi-age-twcore.html)

        [臺灣核心-兒童生長曲線（TW Core Pediatric Weight for Height Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-weight-height-twcore.html)

        [臺灣核心-身高（TW Core Observation Body Height）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-height-twcore.html)

        [臺灣核心-體溫（TW Core Observation Body Temperature）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-temperature-twcore.html)

        [臺灣核心-體重（TW Core Observation Body Weight）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-weight-twcore.html)

        [臺灣核心-頭圍（TW Core Observation Head Circumference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-head-circumference-twcore.html)

        [臺灣核心-心率（TW Core Observation Heart Rate）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-heart-rate-twcore.html)

        [臺灣核心-脈搏血氧飽和度（TW Core Observation Pulse Oximetry）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pulse-oximetry-twcore.html)

        [臺灣核心-呼吸速率（TW Core Observation Respiratory Rate）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-respiratory-rate-twcore.html)

        [臺灣核心-兒童頭圍百分位數（TW Core Observation Pediatric Head Occipital Frontal Circumference Percentile）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-head-circumference-twcore.html)
      )

      input_order :url

      input :observation_patient,
        title: 'Observation patient',
        default: 'Patient/pat-nsysu-hd-001'
      
      input :observation_category,
        title: 'Observation category',
        default: 'vital-signs'

      # Named requests can be used by other tests
      makes_request :observation_patient_category

      run do
        fhir_search('Observation', params: { 'patient': observation_patient, 'category': observation_category }, name: :observation_patient_category)

        assert_response_status(200)
        assert_resource_type('Bundle')
      end
    end

    # 必須（SHALL） 支援透過查詢參數 patient 及 code 查詢所有Observation：
    test do
      title '[GET] Server returns valid results for Observation search by patient and code'
      description %(
        A server SHALL support searching by patient and code on the Observation resource. This test will pass if resources are returned and match the search criteria. If none are returned, the test is skipped.

        Because this is the first search of the sequence, resources in the response will be used for subsequent tests.

        Additionally, this test will check that GET and POST search methods return the same number of results. Search by POST is required by the FHIR R4 specification, and these tests interpret search by GET as a requirement of TW Core v0.3.1.

        [臺灣核心-平均血壓（TW Core Observation Average Blood Pressure）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-averageBloodPressure-twcore.html)

        [臺灣核心-病人照護偏好註記（TW Core Observation Care Experience Preference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-careExperiencePreference-twcore.html)

        [臺灣核心-臨床檢驗檢查（TW Core Observation Clinical Result）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-clinical-result-twcore.html)

        [臺灣核心-職業（TW Core Observation Occupation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-occupation-twcore.html)

        [臺灣核心-妊娠計畫（TW Core Observation Pregnancy Intent）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pregnancy-intent-twcore.html)

        [臺灣核心-妊娠狀態（TW Core Observation Pregnancy Status）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pregnancy-status-twcore.html)

        [臺灣核心-健康狀態篩檢與評估（TW Core Observation Screening Assessment）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-screening-assessment-twcore.html)

        [臺灣核心-性傾向（TW Core Observation Sexual Orientation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-sexual-orientation-twcore.html)

        [臺灣核心-通用檢驗檢查（TW Core Simple Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-simple-twcore.html)

        [臺灣核心-吸菸狀態（TW Core Observation Smoking Status）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-smoking-status-twcore.html)

        [臺灣核心-病人治療偏好註記（TW Core Observation Treatment Intervention Preference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-treatment-intervention-preference-twcore.html)

        [臺灣核心-兒童及青少年身體質量指數（TW Core Pediatric BMI for Age Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-bmi-age-twcore.html)

        [臺灣核心-兒童生長曲線（TW Core Pediatric Weight for Height Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-weight-height-twcore.html)

        [臺灣核心-身高（TW Core Observation Body Height）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-height-twcore.html)

        [臺灣核心-體溫（TW Core Observation Body Temperature）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-temperature-twcore.html)

        [臺灣核心-體重（TW Core Observation Body Weight）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-weight-twcore.html)

        [臺灣核心-頭圍（TW Core Observation Head Circumference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-head-circumference-twcore.html)

        [臺灣核心-心率（TW Core Observation Heart Rate）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-heart-rate-twcore.html)

        [臺灣核心-脈搏血氧飽和度（TW Core Observation Pulse Oximetry）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pulse-oximetry-twcore.html)

        [臺灣核心-呼吸速率（TW Core Observation Respiratory Rate）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-respiratory-rate-twcore.html)

        [臺灣核心-兒童頭圍百分位數（TW Core Observation Pediatric Head Occipital Frontal Circumference Percentile）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-head-circumference-twcore.html)
      )

      input_order :url

      input :observation_patient,
        title: 'Observation patient',
        default: 'Patient/pat-nsysu-hd-001'
      
      input :observation_code,
        title: 'Observation code',
        default: '29463-7'

      # Named requests can be used by other tests
      makes_request :observation

      run do
        fhir_search('Observation', params: { 'patient': observation_patient, 'code': observation_code }, name: :observation)

        assert_response_status(200)
        assert_resource_type('Bundle')
      end
    end

    # 必須（SHALL） 支援透過查詢參數 patient 、 category 及 date 查詢所有Observation：
    test do
      title '[GET] Server returns valid results for Observation search by patient, category and date'
      description %(
        A server SHALL support searching by patient, category and date on the Observation resource. This test will pass if resources are returned and match the search criteria. If none are returned, the test is skipped.

        Because this is the first search of the sequence, resources in the response will be used for subsequent tests.

        Additionally, this test will check that GET and POST search methods return the same number of results. Search by POST is required by the FHIR R4 specification, and these tests interpret search by GET as a requirement of TW Core v0.3.1.

        [臺灣核心-平均血壓（TW Core Observation Average Blood Pressure）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-averageBloodPressure-twcore.html)

        [臺灣核心-病人照護偏好註記（TW Core Observation Care Experience Preference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-careExperiencePreference-twcore.html)

        [臺灣核心-臨床檢驗檢查（TW Core Observation Clinical Result）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-clinical-result-twcore.html)

        [臺灣核心-職業（TW Core Observation Occupation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-occupation-twcore.html)

        [臺灣核心-妊娠計畫（TW Core Observation Pregnancy Intent）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pregnancy-intent-twcore.html)

        [臺灣核心-妊娠狀態（TW Core Observation Pregnancy Status）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pregnancy-status-twcore.html)

        [臺灣核心-健康狀態篩檢與評估（TW Core Observation Screening Assessment）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-screening-assessment-twcore.html)

        [臺灣核心-性傾向（TW Core Observation Sexual Orientation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-sexual-orientation-twcore.html)

        [臺灣核心-通用檢驗檢查（TW Core Simple Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-simple-twcore.html)

        [臺灣核心-吸菸狀態（TW Core Observation Smoking Status）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-smoking-status-twcore.html)

        [臺灣核心-病人治療偏好註記（TW Core Observation Treatment Intervention Preference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-treatment-intervention-preference-twcore.html)

        [臺灣核心-兒童及青少年身體質量指數（TW Core Pediatric BMI for Age Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-bmi-age-twcore.html)

        [臺灣核心-兒童生長曲線（TW Core Pediatric Weight for Height Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-weight-height-twcore.html)

        [臺灣核心-身高（TW Core Observation Body Height）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-height-twcore.html)

        [臺灣核心-體溫（TW Core Observation Body Temperature）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-temperature-twcore.html)

        [臺灣核心-體重（TW Core Observation Body Weight）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-weight-twcore.html)

        [臺灣核心-頭圍（TW Core Observation Head Circumference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-head-circumference-twcore.html)

        [臺灣核心-心率（TW Core Observation Heart Rate）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-heart-rate-twcore.html)

        [臺灣核心-脈搏血氧飽和度（TW Core Observation Pulse Oximetry）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pulse-oximetry-twcore.html)

        [臺灣核心-呼吸速率（TW Core Observation Respiratory Rate）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-respiratory-rate-twcore.html)

        [臺灣核心-兒童頭圍百分位數（TW Core Observation Pediatric Head Occipital Frontal Circumference Percentile）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-head-circumference-twcore.html)
      )

      input_order :url

      input :observation_patient,
        title: 'Observation patient',
        default: 'Patient/pat-nsysu-hd-001'
      
      input :observation_category,
        title: 'Observation category',
        default: 'vital-signs'
      
      input :observation_date,
        title: 'Observation date',
        default: 'gt2022-04-01'

      # Named requests can be used by other tests
      makes_request :observation

      run do
        fhir_search('Observation', params: { 'patient': observation_patient, 'category': observation_category, 'date': observation_date }, name: :observation)

        assert_response_status(200)
        assert_resource_type('Bundle')
      end
    end

    # 建議應該（SHOULD） 支援透過查詢參數 patient 、 category 及 status 查詢所有Observation：
    test do
      title '[GET] Server returns valid results for Observation search by patient, category and status'
      description %(
        A server SHALL support searching by patient, category and status on the Observation resource. This test will pass if resources are returned and match the search criteria. If none are returned, the test is skipped.

        [臺灣核心-平均血壓（TW Core Observation Average Blood Pressure）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-averageBloodPressure-twcore.html)

        [臺灣核心-病人照護偏好註記（TW Core Observation Care Experience Preference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-careExperiencePreference-twcore.html)

        [臺灣核心-臨床檢驗檢查（TW Core Observation Clinical Result）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-clinical-result-twcore.html)

        [臺灣核心-職業（TW Core Observation Occupation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-occupation-twcore.html)

        [臺灣核心-妊娠計畫（TW Core Observation Pregnancy Intent）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pregnancy-intent-twcore.html)

        [臺灣核心-妊娠狀態（TW Core Observation Pregnancy Status）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pregnancy-status-twcore.html)

        [臺灣核心-健康狀態篩檢與評估（TW Core Observation Screening Assessment）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-screening-assessment-twcore.html)

        [臺灣核心-性傾向（TW Core Observation Sexual Orientation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-sexual-orientation-twcore.html)

        [臺灣核心-通用檢驗檢查（TW Core Simple Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-simple-twcore.html)

        [臺灣核心-吸菸狀態（TW Core Observation Smoking Status）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-smoking-status-twcore.html)

        [臺灣核心-病人治療偏好註記（TW Core Observation Treatment Intervention Preference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-treatment-intervention-preference-twcore.html)

        [臺灣核心-兒童及青少年身體質量指數（TW Core Pediatric BMI for Age Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-bmi-age-twcore.html)

        [臺灣核心-兒童生長曲線（TW Core Pediatric Weight for Height Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-weight-height-twcore.html)

        [臺灣核心-身高（TW Core Observation Body Height）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-height-twcore.html)

        [臺灣核心-體溫（TW Core Observation Body Temperature）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-temperature-twcore.html)

        [臺灣核心-體重（TW Core Observation Body Weight）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-weight-twcore.html)

        [臺灣核心-頭圍（TW Core Observation Head Circumference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-head-circumference-twcore.html)

        [臺灣核心-心率（TW Core Observation Heart Rate）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-heart-rate-twcore.html)

        [臺灣核心-脈搏血氧飽和度（TW Core Observation Pulse Oximetry）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pulse-oximetry-twcore.html)

        [臺灣核心-呼吸速率（TW Core Observation Respiratory Rate）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-respiratory-rate-twcore.html)

        [臺灣核心-兒童頭圍百分位數（TW Core Observation Pediatric Head Occipital Frontal Circumference Percentile）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-head-circumference-twcore.html)
      )

      input_order :url

      input :observation_patient,
        title: 'Observation patient',
        default: 'Patient/pat-nsysu-hd-001'
      
      input :observation_category,
        title: 'Observation category',
        default: 'vital-signs'

      input :observation_status,
        title: 'Observation status',
        default: 'final'

      run do
        fhir_search('Observation', params: { 'patient': observation_patient, 'category': observation_category, 'status': observation_status })

        assert_response_status(200)
        assert_resource_type('Bundle')
      end
    end

    # 建議應該（SHOULD） 支援透過查詢參數 patient 、 category 及 _lastUpdated 查詢所有Observation：
    test do
      title '[GET] Server returns valid results for Observation search by patient, _lastUpdated and status'
      description %(
        A server SHALL support searching by patient, _lastUpdated and status on the Observation resource. This test will pass if resources are returned and match the search criteria. If none are returned, the test is skipped.

        [臺灣核心-平均血壓（TW Core Observation Average Blood Pressure）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-averageBloodPressure-twcore.html)

        [臺灣核心-病人照護偏好註記（TW Core Observation Care Experience Preference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-careExperiencePreference-twcore.html)

        [臺灣核心-臨床檢驗檢查（TW Core Observation Clinical Result）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-clinical-result-twcore.html)

        [臺灣核心-職業（TW Core Observation Occupation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-occupation-twcore.html)

        [臺灣核心-妊娠計畫（TW Core Observation Pregnancy Intent）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pregnancy-intent-twcore.html)

        [臺灣核心-妊娠狀態（TW Core Observation Pregnancy Status）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pregnancy-status-twcore.html)

        [臺灣核心-健康狀態篩檢與評估（TW Core Observation Screening Assessment）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-screening-assessment-twcore.html)

        [臺灣核心-性傾向（TW Core Observation Sexual Orientation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-sexual-orientation-twcore.html)

        [臺灣核心-通用檢驗檢查（TW Core Simple Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-simple-twcore.html)

        [臺灣核心-吸菸狀態（TW Core Observation Smoking Status）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-smoking-status-twcore.html)

        [臺灣核心-病人治療偏好註記（TW Core Observation Treatment Intervention Preference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-treatment-intervention-preference-twcore.html)

        [臺灣核心-兒童及青少年身體質量指數（TW Core Pediatric BMI for Age Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-bmi-age-twcore.html)

        [臺灣核心-兒童生長曲線（TW Core Pediatric Weight for Height Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-weight-height-twcore.html)

        [臺灣核心-身高（TW Core Observation Body Height）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-height-twcore.html)

        [臺灣核心-體溫（TW Core Observation Body Temperature）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-temperature-twcore.html)

        [臺灣核心-體重（TW Core Observation Body Weight）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-weight-twcore.html)

        [臺灣核心-頭圍（TW Core Observation Head Circumference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-head-circumference-twcore.html)

        [臺灣核心-心率（TW Core Observation Heart Rate）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-heart-rate-twcore.html)

        [臺灣核心-脈搏血氧飽和度（TW Core Observation Pulse Oximetry）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pulse-oximetry-twcore.html)

        [臺灣核心-呼吸速率（TW Core Observation Respiratory Rate）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-respiratory-rate-twcore.html)

        [臺灣核心-兒童頭圍百分位數（TW Core Observation Pediatric Head Occipital Frontal Circumference Percentile）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-head-circumference-twcore.html)
      )

      input_order :url

      input :observation_patient,
        title: 'Observation patient',
        default: 'Patient/pat-nsysu-hd-001'
      
      input :observation_category,
        title: 'Observation category',
        default: 'vital-signs'

      input :observation_lastUpdated,
        title: 'Observation _lastUpdated',
        default: 'gt2022-04-01'

      run do
        fhir_search('Observation', params: { 'patient': observation_patient, 'category': observation_category, '_lastUpdated': observation_lastUpdated })

        assert_response_status(200)
        assert_resource_type('Bundle')
      end
    end

    # 建議應該（SHOULD） 支援透過查詢參數 patient 、 code 及 date 查詢所有Observation：
    test do
      title '[GET] Server returns valid results for Observation search by patient, code and date'
      description %(
        A server SHALL support searching by patient, code and date on the Observation resource. This test will pass if resources are returned and match the search criteria. If none are returned, the test is skipped.

        [臺灣核心-平均血壓（TW Core Observation Average Blood Pressure）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-averageBloodPressure-twcore.html)

        [臺灣核心-病人照護偏好註記（TW Core Observation Care Experience Preference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-careExperiencePreference-twcore.html)

        [臺灣核心-臨床檢驗檢查（TW Core Observation Clinical Result）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-clinical-result-twcore.html)

        [臺灣核心-職業（TW Core Observation Occupation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-occupation-twcore.html)

        [臺灣核心-妊娠計畫（TW Core Observation Pregnancy Intent）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pregnancy-intent-twcore.html)

        [臺灣核心-妊娠狀態（TW Core Observation Pregnancy Status）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pregnancy-status-twcore.html)

        [臺灣核心-健康狀態篩檢與評估（TW Core Observation Screening Assessment）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-screening-assessment-twcore.html)

        [臺灣核心-性傾向（TW Core Observation Sexual Orientation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-sexual-orientation-twcore.html)

        [臺灣核心-通用檢驗檢查（TW Core Simple Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-simple-twcore.html)

        [臺灣核心-吸菸狀態（TW Core Observation Smoking Status）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-smoking-status-twcore.html)

        [臺灣核心-病人治療偏好註記（TW Core Observation Treatment Intervention Preference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-treatment-intervention-preference-twcore.html)

        [臺灣核心-兒童及青少年身體質量指數（TW Core Pediatric BMI for Age Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-bmi-age-twcore.html)

        [臺灣核心-兒童生長曲線（TW Core Pediatric Weight for Height Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-weight-height-twcore.html)

        [臺灣核心-身高（TW Core Observation Body Height）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-height-twcore.html)

        [臺灣核心-體溫（TW Core Observation Body Temperature）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-temperature-twcore.html)

        [臺灣核心-體重（TW Core Observation Body Weight）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-weight-twcore.html)

        [臺灣核心-頭圍（TW Core Observation Head Circumference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-head-circumference-twcore.html)

        [臺灣核心-心率（TW Core Observation Heart Rate）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-heart-rate-twcore.html)

        [臺灣核心-脈搏血氧飽和度（TW Core Observation Pulse Oximetry）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pulse-oximetry-twcore.html)

        [臺灣核心-呼吸速率（TW Core Observation Respiratory Rate）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-respiratory-rate-twcore.html)

        [臺灣核心-兒童頭圍百分位數（TW Core Observation Pediatric Head Occipital Frontal Circumference Percentile）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-head-circumference-twcore.html)
      )

      input_order :url

      input :observation_patient,
        title: 'Observation patient',
        default: 'Organization/org-nsysu'
      
      input :observation_code,
        title: 'Observation code',
        default: '29463-7'

      input :observation_date,
        title: 'Observation date',
        default: 'gt2022-04-01'

      run do
        fhir_search('Observation', params: { 'patient': observation_patient, 'code': observation_code, 'date': observation_date })

        assert_response_status(200)
        assert_resource_type('Bundle')
      end
    end
    
    # 驗證查詢 patient 及 category 的 Observation resource 是否合規
    test do
      title '[GET] Observation resource is valid'
      description %(
        Verify that the Observation resource search by patient and category returned from the server is a valid FHIR resource.

        * Verifying the HTTP status code of a response.
        
        * Verifying that a string is valid JSON.
        
        * Validating a FHIR Resource.

        [臺灣核心-平均血壓（TW Core Observation Average Blood Pressure）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-averageBloodPressure-twcore.html)

        [臺灣核心-病人照護偏好註記（TW Core Observation Care Experience Preference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-careExperiencePreference-twcore.html)

        [臺灣核心-臨床檢驗檢查（TW Core Observation Clinical Result）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-clinical-result-twcore.html)

        [臺灣核心-職業（TW Core Observation Occupation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-occupation-twcore.html)

        [臺灣核心-妊娠計畫（TW Core Observation Pregnancy Intent）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pregnancy-intent-twcore.html)

        [臺灣核心-妊娠狀態（TW Core Observation Pregnancy Status）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pregnancy-status-twcore.html)

        [臺灣核心-健康狀態篩檢與評估（TW Core Observation Screening Assessment）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-screening-assessment-twcore.html)

        [臺灣核心-性傾向（TW Core Observation Sexual Orientation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-sexual-orientation-twcore.html)

        [臺灣核心-通用檢驗檢查（TW Core Simple Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-simple-twcore.html)

        [臺灣核心-吸菸狀態（TW Core Observation Smoking Status）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-smoking-status-twcore.html)

        [臺灣核心-病人治療偏好註記（TW Core Observation Treatment Intervention Preference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-treatment-intervention-preference-twcore.html)

        [臺灣核心-兒童及青少年身體質量指數（TW Core Pediatric BMI for Age Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-bmi-age-twcore.html)

        [臺灣核心-兒童生長曲線（TW Core Pediatric Weight for Height Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-weight-height-twcore.html)

        [臺灣核心-身高（TW Core Observation Body Height）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-height-twcore.html)

        [臺灣核心-體溫（TW Core Observation Body Temperature）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-temperature-twcore.html)

        [臺灣核心-體重（TW Core Observation Body Weight）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-weight-twcore.html)

        [臺灣核心-頭圍（TW Core Observation Head Circumference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-head-circumference-twcore.html)

        [臺灣核心-心率（TW Core Observation Heart Rate）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-heart-rate-twcore.html)

        [臺灣核心-脈搏血氧飽和度（TW Core Observation Pulse Oximetry）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pulse-oximetry-twcore.html)

        [臺灣核心-呼吸速率（TW Core Observation Respiratory Rate）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-respiratory-rate-twcore.html)

        [臺灣核心-兒童頭圍百分位數（TW Core Observation Pediatric Head Occipital Frontal Circumference Percentile）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-head-circumference-twcore.html)
      )
      # This test will use the response from the :observation_patient_category request in the
      # previous test
      uses_request :observation_patient_category

      run do
        assert_response_status(200)
        assert_resource_type('Bundle')
        assert_valid_resource
      end
    end

    # 驗證輸入的Resource是否合規
    test do 
      title '[POST] Input Observation resource is valid'
      description %(
        Verify that the Observation resource input is a valid FHIR resource.

        * Verifying the HTTP status code of a response.
        
        * Verifying that a string is valid JSON.
        
        * Validating a FHIR Resource.

        [臺灣核心-實驗室檢驗檢查（TW Core Observation Laboratory Result）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-laboratoryResult-twcore.html)

        [臺灣核心-生命體徵（TW Core Observation Vital Signs）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-vitalSigns-twcore.html)

        [臺灣核心-血壓（TW Core Observation Blood Pressure）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bloodPressure-twcore.html)

        [臺灣核心-身體質量指數（TW Core Observation BMI）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bmi-twcore.html)

        [臺灣核心-平均血壓（TW Core Observation Average Blood Pressure）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-averageBloodPressure-twcore.html)

        [臺灣核心-病人照護偏好註記（TW Core Observation Care Experience Preference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-careExperiencePreference-twcore.html)

        [臺灣核心-臨床檢驗檢查（TW Core Observation Clinical Result）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-clinical-result-twcore.html)

        [臺灣核心-職業（TW Core Observation Occupation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-occupation-twcore.html)

        [臺灣核心-妊娠計畫（TW Core Observation Pregnancy Intent）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pregnancy-intent-twcore.html)

        [臺灣核心-妊娠狀態（TW Core Observation Pregnancy Status）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pregnancy-status-twcore.html)

        [臺灣核心-健康狀態篩檢與評估（TW Core Observation Screening Assessment）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-screening-assessment-twcore.html)

        [臺灣核心-性傾向（TW Core Observation Sexual Orientation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-sexual-orientation-twcore.html)

        [臺灣核心-通用檢驗檢查（TW Core Simple Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-simple-twcore.html)

        [臺灣核心-吸菸狀態（TW Core Observation Smoking Status）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-smoking-status-twcore.html)

        [臺灣核心-病人治療偏好註記（TW Core Observation Treatment Intervention Preference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-treatment-intervention-preference-twcore.html)

        [臺灣核心-兒童及青少年身體質量指數（TW Core Pediatric BMI for Age Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-bmi-age-twcore.html)

        [臺灣核心-兒童生長曲線（TW Core Pediatric Weight for Height Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-weight-height-twcore.html)

        [臺灣核心-身高（TW Core Observation Body Height）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-height-twcore.html)

        [臺灣核心-體溫（TW Core Observation Body Temperature）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-temperature-twcore.html)

        [臺灣核心-體重（TW Core Observation Body Weight）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-weight-twcore.html)

        [臺灣核心-頭圍（TW Core Observation Head Circumference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-head-circumference-twcore.html)

        [臺灣核心-心率（TW Core Observation Heart Rate）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-heart-rate-twcore.html)

        [臺灣核心-脈搏血氧飽和度（TW Core Observation Pulse Oximetry）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pulse-oximetry-twcore.html)

        [臺灣核心-呼吸速率（TW Core Observation Respiratory Rate）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-respiratory-rate-twcore.html)

        [臺灣核心-兒童頭圍百分位數（TW Core Observation Pediatric Head Occipital Frontal Circumference Percentile）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-head-circumference-twcore.html)
      )

      input_order :url

      input :observation_resource,
        title: 'Observation Resource',
        default: '''{
          "resourceType" : "Observation",
          "id" : "obs-averageBloodPressure-example",
          "meta" : {
            "profile" : ["https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition/Observation-averageBloodPressure-twcore"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Generated Narrative: Observation obs-averageBloodPressure-example</b></p><a name=\"obs-averageBloodPressure-example\"> </a><a name=\"hcobs-averageBloodPressure-example\"> </a><a name=\"obs-averageBloodPressure-example-en-US\"> </a><p><b>status</b>: Final</p><p><b>category</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/observation-category vital-signs}\">Vital Signs</span></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 96607-7}\">平均血壓</span></p><p><b>subject</b>: <a href=\"Patient-pat-example.html\">陳加玲(official) Female, DoB: 1990-01-01 ( Medical record number\u00a0(use:\u00a0official,\u00a0))</a></p><p><b>effective</b>: 2024-01-01</p><p><b>performer</b>: <a href=\"Practitioner-pra-nurse-example.html\">Practitioner 陳莉(official)</a></p><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 96608-5}\">Systolic blood pressure mean</span></p><p><b>value</b>: 120 mm[Hg]<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM  codemm[Hg] = "mm[Hg]")</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 96609-3}\">Diastolic blood pressure mean</span></p><p><b>value</b>: 80 mm[Hg]<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM  codemm[Hg] = "mm[Hg]")</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://snomed.info/sct 246432004}\">Number of occurrences</span></p><p><b>value</b>: 3</p></blockquote></div>"
          },
          "status" : "final",
          "category" : [{
            "coding" : [{
              "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
              "code" : "vital-signs",
              "display" : "Vital Signs"
            }]
          }],
          "code" : {
            "coding" : [{
              "system" : "http://loinc.org",
              "code" : "85354-9"
            },
            {
              "system" : "http://loinc.org",
              "code" : "96607-7",
              "display" : "Blood pressure panel mean systolic and mean diastolic"
            }],
            "text" : "平均血壓"
          },
          "subject" : {
            "reference" : "Patient/pat-nsysu-hd-001"
          },
          "effectiveDateTime" : "2024-01-01",
          "performer" : [{
            "reference" : "Practitioner/1004"
          }],
          "component" : [{
            "code" : {
              "coding" : [{
                "system" : "http://loinc.org",
                "code" : "96608-5"
              }]
            },
            "valueQuantity" : {
              "value" : 120,
              "unit" : "mm[Hg]",
              "system" : "http://unitsofmeasure.org",
              "code" : "mm[Hg]"
            }
          },
          {
            "code" : {
              "coding" : [{
                "system" : "http://loinc.org",
                "code" : "8480-6"
              }]
            },
            "valueQuantity" : {
              "value" : 80,
              "unit" : "mm[Hg]",
              "system" : "http://unitsofmeasure.org",
              "code" : "mm[Hg]"
            }
          },
          {
            "code" : {
              "coding" : [{
                "system" : "http://loinc.org",
                "code" : "8462-4"
              }]
            },
            "valueQuantity" : {
              "value" : 80,
              "unit" : "mm[Hg]",
              "system" : "http://unitsofmeasure.org",
              "code" : "mm[Hg]"
            }
          },
          {
            "code" : {
              "coding" : [{
                "system" : "http://loinc.org",
                "code" : "96609-3"
              }]
            },
            "valueQuantity" : {
              "value" : 80,
              "unit" : "mm[Hg]",
              "system" : "http://unitsofmeasure.org",
              "code" : "mm[Hg]"
            }
          },
          {
            "code" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "246432004"
              }]
            },
            "valueQuantity" : {
              "value" : 3
            }
          }]
        }'''
      
      output :observation_value
      
      run do 
        assert_valid_json(observation_resource) # For safety
        resource_hash = JSON.parse(observation_resource)
        observation_resource = FHIR::Observation.new(resource_hash)
        # output observation_value: observation_resource
        assert_valid_resource(resource: observation_resource)
        # if resource_is_valid?(resource: observation_resource)
        # end
      end 
    end 

    # 發送POST請求包含Resource Body給FHIR Server
    test do 
      title '[POST] Send Observation Resource to FHIR Server'
      description %(
        Send a input Observation resource to a FHIR server database.

        [臺灣核心-實驗室檢驗檢查（TW Core Observation Laboratory Result）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-laboratoryResult-twcore.html)

        [臺灣核心-生命體徵（TW Core Observation Vital Signs）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-vitalSigns-twcore.html)

        [臺灣核心-血壓（TW Core Observation Blood Pressure）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bloodPressure-twcore.html)

        [臺灣核心-身體質量指數（TW Core Observation BMI）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-bmi-twcore.html)

        [臺灣核心-平均血壓（TW Core Observation Average Blood Pressure）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-averageBloodPressure-twcore.html)

        [臺灣核心-病人照護偏好註記（TW Core Observation Care Experience Preference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-careExperiencePreference-twcore.html)

        [臺灣核心-臨床檢驗檢查（TW Core Observation Clinical Result）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-clinical-result-twcore.html)

        [臺灣核心-職業（TW Core Observation Occupation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-occupation-twcore.html)

        [臺灣核心-妊娠計畫（TW Core Observation Pregnancy Intent）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pregnancy-intent-twcore.html)

        [臺灣核心-妊娠狀態（TW Core Observation Pregnancy Status）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pregnancy-status-twcore.html)

        [臺灣核心-健康狀態篩檢與評估（TW Core Observation Screening Assessment）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-screening-assessment-twcore.html)

        [臺灣核心-性傾向（TW Core Observation Sexual Orientation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-sexual-orientation-twcore.html)

        [臺灣核心-通用檢驗檢查（TW Core Simple Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-simple-twcore.html)

        [臺灣核心-吸菸狀態（TW Core Observation Smoking Status）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-smoking-status-twcore.html)

        [臺灣核心-病人治療偏好註記（TW Core Observation Treatment Intervention Preference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-treatment-intervention-preference-twcore.html)

        [臺灣核心-兒童及青少年身體質量指數（TW Core Pediatric BMI for Age Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-bmi-age-twcore.html)

        [臺灣核心-兒童生長曲線（TW Core Pediatric Weight for Height Observation）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-weight-height-twcore.html)

        [臺灣核心-身高（TW Core Observation Body Height）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-height-twcore.html)

        [臺灣核心-體溫（TW Core Observation Body Temperature）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-temperature-twcore.html)

        [臺灣核心-體重（TW Core Observation Body Weight）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-body-weight-twcore.html)

        [臺灣核心-頭圍（TW Core Observation Head Circumference）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-head-circumference-twcore.html)

        [臺灣核心-心率（TW Core Observation Heart Rate）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-heart-rate-twcore.html)

        [臺灣核心-脈搏血氧飽和度（TW Core Observation Pulse Oximetry）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pulse-oximetry-twcore.html)

        [臺灣核心-呼吸速率（TW Core Observation Respiratory Rate）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-respiratory-rate-twcore.html)

        [臺灣核心-兒童頭圍百分位數（TW Core Observation Pediatric Head Occipital Frontal Circumference Percentile）](https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition-Observation-pediatric-head-circumference-twcore.html)
      )

      input_order :url
      
      input :observation_resource,
        title: 'Observation Resource'

      run do 
        resource_hash = JSON.parse(observation_resource)
        response = fhir_create FHIR::Observation.new(resource_hash)
        assert response.status == 201
      end
    end
  end
end
