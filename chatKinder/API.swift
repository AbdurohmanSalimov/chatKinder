// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetMessagesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetMessages {
      messages {
        __typename
        user_id
        message_id
        message
        name
      }
    }
    """

  public let operationName: String = "GetMessages"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("messages", type: .nonNull(.list(.object(Message.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(messages: [Message?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "messages": messages.map { (value: Message?) -> ResultMap? in value.flatMap { (value: Message) -> ResultMap in value.resultMap } }])
    }

    public var messages: [Message?] {
      get {
        return (resultMap["messages"] as! [ResultMap?]).map { (value: ResultMap?) -> Message? in value.flatMap { (value: ResultMap) -> Message in Message(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Message?) -> ResultMap? in value.flatMap { (value: Message) -> ResultMap in value.resultMap } }, forKey: "messages")
      }
    }

    public struct Message: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Message"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userId: Int, messageId: Int, message: String, name: String) {
        self.init(unsafeResultMap: ["__typename": "Message", "user_id": userId, "message_id": messageId, "message": message, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userId: Int {
        get {
          return resultMap["user_id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var messageId: Int {
        get {
          return resultMap["message_id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "message_id")
        }
      }

      public var message: String {
        get {
          return resultMap["message"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "message")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class LoginUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation LoginUser($userName: String!, $password: String!) {
      login(userName: $userName, password: $password) {
        __typename
        id
        name
      }
    }
    """

  public let operationName: String = "LoginUser"

  public var userName: String
  public var password: String

  public init(userName: String, password: String) {
    self.userName = userName
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["userName": userName, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["userName": GraphQLVariable("userName"), "password": GraphQLVariable("password")], type: .nonNull(.object(Login.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.resultMap])
    }

    public var login: Login {
      get {
        return Login(unsafeResultMap: resultMap["login"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class SignUpMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SignUp($userName: String!, $password: String!) {
      signUp(userName: $userName, password: $password) {
        __typename
        id
        name
      }
    }
    """

  public let operationName: String = "SignUp"

  public var userName: String
  public var password: String

  public init(userName: String, password: String) {
    self.userName = userName
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["userName": userName, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("signUp", arguments: ["userName": GraphQLVariable("userName"), "password": GraphQLVariable("password")], type: .nonNull(.object(SignUp.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(signUp: SignUp) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "signUp": signUp.resultMap])
    }

    public var signUp: SignUp {
      get {
        return SignUp(unsafeResultMap: resultMap["signUp"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "signUp")
      }
    }

    public struct SignUp: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class WriteMessageMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation WriteMessage($message: String!, $userID: Int!) {
      writeMessage(message: $message, userID: $userID)
    }
    """

  public let operationName: String = "WriteMessage"

  public var message: String
  public var userID: Int

  public init(message: String, userID: Int) {
    self.message = message
    self.userID = userID
  }

  public var variables: GraphQLMap? {
    return ["message": message, "userID": userID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("writeMessage", arguments: ["message": GraphQLVariable("message"), "userID": GraphQLVariable("userID")], type: .nonNull(.scalar(String.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(writeMessage: String) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "writeMessage": writeMessage])
    }

    public var writeMessage: String {
      get {
        return resultMap["writeMessage"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "writeMessage")
      }
    }
  }
}

public final class SubscriptionSubscription: GraphQLSubscription {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    subscription Subscription {
      newMessage {
        __typename
        user_id
        message_id
        message
        name
      }
    }
    """

  public let operationName: String = "Subscription"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Subscription"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("newMessage", type: .nonNull(.object(NewMessage.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(newMessage: NewMessage) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "newMessage": newMessage.resultMap])
    }

    public var newMessage: NewMessage {
      get {
        return NewMessage(unsafeResultMap: resultMap["newMessage"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "newMessage")
      }
    }

    public struct NewMessage: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Message"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("message", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userId: Int, messageId: Int, message: String, name: String) {
        self.init(unsafeResultMap: ["__typename": "Message", "user_id": userId, "message_id": messageId, "message": message, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userId: Int {
        get {
          return resultMap["user_id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var messageId: Int {
        get {
          return resultMap["message_id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "message_id")
        }
      }

      public var message: String {
        get {
          return resultMap["message"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "message")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}
