/// status : true
/// message : "Terms and Conditions"
/// data : {"id":1,"title":"Terms of Service","content":"<h1>Privacy Policy</h1>\n                        <p>At studylancer, accessible from studylancer.com, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by studylancer and how we use it. If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us. This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in studylancer. This policy is not applicable to any information collected offline or via channels other than this website.</p>\n                        <h1>Consent</h1>\n                        <p>By using our website, you hereby consent to our Privacy Policy and agree to its terms.</p>\n                        <h1>Information we collect</h1>\n                        <p>The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information. If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide. When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.</p>\n                        <h1>How we use your information</h1>\n                        <p>We use the information we collect in various ways, including to:</p>\n                        <ul>\n                        <li>Provide, operate, and maintain our website.</li>\n                        <li>Improve, personalise, and expand our website.</li>\n                        <li>Understand and analyse how you use our website.</li>\n                        <li>Develop new products, services, features, and functionality.</li>\n                        <li>Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes.</li>\n                        <li>Send you emails.</li>\n                        <li>Find and prevent fraud.</li>\n                        <li>Log Files.</li>\n                        </ul>\n                        <p>Studylancer follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analysing trends, administering the site, tracking users movement on the website, and gathering demographic information.</p>\n                        <h1>Cookies and Web Beacons</h1>\n                        <p>Like any other website, studylancer uses \"cookies\". These cookies are used to store information including visitors preferences, and the pages on the website that the visitor accessed or visited. The information is used to optimise the users experience by customising our web page content based on visitors browser type and/or other information.</p>\n                        <h1>Advertising Partners Privacy Policies</h1>\n                        <p>You may consult this list to find the Privacy Policy for each of the advertising partners of studylancer. \n                            Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on studylancer, which are sent directly to users browser.</p>\n                        <p>They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit. Note that studylancer has no access to or control over these cookies that are used by third-party advertisers.</p>\n                        <h1>Third Party Privacy Policies</h1>\n                        <p>Studylancers Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.</p>\n                        <p>You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers respective websites.</p>\n                        <p>CCPA Privacy Rights (Do Not Sell My Personal Information) Under the CCPA, among other rights, California consumers have the right to:</p>\n                        <ul>\n                        <li>Request that a business that collects a consumers personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.</li>\n                        <li>Request that a business delete any personal data about the consumer that a business has collected.</li>\n                        <li>Request that a business that sells a consumers personal data, not sell the consumers personal data.</li>\n                        <li>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</li>\n                        </ul>\n                        <h1>GDPR Data Protection Rights</h1>\n                        <p>We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:</p>\n                        <ul>\n                        <li>The right to access – You have the right to request copies of your personal data. We may charge you a small fee for this service.</li>\n                        <li>The right to rectification – You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.</li>\n                        <li>The right to erasure – You have the right to request that we erase your personal data, under certain conditions.</li>\n                        <li>The right to restrict processing – You have the right to request that we restrict the processing of your personal data, under certain conditions.</li>\n                        <li>The right to object to processing – You have the right to object to our processing of your personal data, under certain conditions.</li>\n                        <li>The right to data portability – You have the right to request that we transfer the data that we have collected to another organisation, or directly to you, under certain conditions.</li>\n                        <li>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</li>\n                        </ul>\n                        <h1>Childrens Information</h1>\n                        <p>Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.</p>\n                        <p>Studylancer does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.</p>\n                        <h1>Changes to This Privacy Policy</h1>\n                        <p>We may update our Privacy Policy from time to time. Thus, we advise you to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.</p>\n                        <p>These changes are effective immediately, after they are posted on this page. Our Privacy Policy was created with the help of the Privacy Policy Generator.</p>\n                        <h1>Contact Us</h1>\n                        <p>If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us.</p>","published_at":"2023-12-01 13:25:39","enabled":1,"created_at":"2023-12-01 13:25:39","updated_at":"2023-12-01 13:25:39"}

class TermsModel {
  TermsModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  TermsModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
TermsModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => TermsModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : 1
/// title : "Terms of Service"
/// content : "<h1>Privacy Policy</h1>\n                        <p>At studylancer, accessible from studylancer.com, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by studylancer and how we use it. If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us. This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in studylancer. This policy is not applicable to any information collected offline or via channels other than this website.</p>\n                        <h1>Consent</h1>\n                        <p>By using our website, you hereby consent to our Privacy Policy and agree to its terms.</p>\n                        <h1>Information we collect</h1>\n                        <p>The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information. If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide. When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.</p>\n                        <h1>How we use your information</h1>\n                        <p>We use the information we collect in various ways, including to:</p>\n                        <ul>\n                        <li>Provide, operate, and maintain our website.</li>\n                        <li>Improve, personalise, and expand our website.</li>\n                        <li>Understand and analyse how you use our website.</li>\n                        <li>Develop new products, services, features, and functionality.</li>\n                        <li>Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes.</li>\n                        <li>Send you emails.</li>\n                        <li>Find and prevent fraud.</li>\n                        <li>Log Files.</li>\n                        </ul>\n                        <p>Studylancer follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analysing trends, administering the site, tracking users movement on the website, and gathering demographic information.</p>\n                        <h1>Cookies and Web Beacons</h1>\n                        <p>Like any other website, studylancer uses \"cookies\". These cookies are used to store information including visitors preferences, and the pages on the website that the visitor accessed or visited. The information is used to optimise the users experience by customising our web page content based on visitors browser type and/or other information.</p>\n                        <h1>Advertising Partners Privacy Policies</h1>\n                        <p>You may consult this list to find the Privacy Policy for each of the advertising partners of studylancer. \n                            Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on studylancer, which are sent directly to users browser.</p>\n                        <p>They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit. Note that studylancer has no access to or control over these cookies that are used by third-party advertisers.</p>\n                        <h1>Third Party Privacy Policies</h1>\n                        <p>Studylancers Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.</p>\n                        <p>You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers respective websites.</p>\n                        <p>CCPA Privacy Rights (Do Not Sell My Personal Information) Under the CCPA, among other rights, California consumers have the right to:</p>\n                        <ul>\n                        <li>Request that a business that collects a consumers personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.</li>\n                        <li>Request that a business delete any personal data about the consumer that a business has collected.</li>\n                        <li>Request that a business that sells a consumers personal data, not sell the consumers personal data.</li>\n                        <li>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</li>\n                        </ul>\n                        <h1>GDPR Data Protection Rights</h1>\n                        <p>We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:</p>\n                        <ul>\n                        <li>The right to access – You have the right to request copies of your personal data. We may charge you a small fee for this service.</li>\n                        <li>The right to rectification – You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.</li>\n                        <li>The right to erasure – You have the right to request that we erase your personal data, under certain conditions.</li>\n                        <li>The right to restrict processing – You have the right to request that we restrict the processing of your personal data, under certain conditions.</li>\n                        <li>The right to object to processing – You have the right to object to our processing of your personal data, under certain conditions.</li>\n                        <li>The right to data portability – You have the right to request that we transfer the data that we have collected to another organisation, or directly to you, under certain conditions.</li>\n                        <li>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</li>\n                        </ul>\n                        <h1>Childrens Information</h1>\n                        <p>Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.</p>\n                        <p>Studylancer does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.</p>\n                        <h1>Changes to This Privacy Policy</h1>\n                        <p>We may update our Privacy Policy from time to time. Thus, we advise you to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.</p>\n                        <p>These changes are effective immediately, after they are posted on this page. Our Privacy Policy was created with the help of the Privacy Policy Generator.</p>\n                        <h1>Contact Us</h1>\n                        <p>If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us.</p>"
/// published_at : "2023-12-01 13:25:39"
/// enabled : 1
/// created_at : "2023-12-01 13:25:39"
/// updated_at : "2023-12-01 13:25:39"

class Data {
  Data({
      num? id, 
      String? title, 
      String? content, 
      String? publishedAt, 
      num? enabled, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _content = content;
    _publishedAt = publishedAt;
    _enabled = enabled;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _content = json['content'];
    _publishedAt = json['published_at'];
    _enabled = json['enabled'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _title;
  String? _content;
  String? _publishedAt;
  num? _enabled;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  String? title,
  String? content,
  String? publishedAt,
  num? enabled,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  title: title ?? _title,
  content: content ?? _content,
  publishedAt: publishedAt ?? _publishedAt,
  enabled: enabled ?? _enabled,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get title => _title;
  String? get content => _content;
  String? get publishedAt => _publishedAt;
  num? get enabled => _enabled;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['content'] = _content;
    map['published_at'] = _publishedAt;
    map['enabled'] = _enabled;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}