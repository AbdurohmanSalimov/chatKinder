//
//  Network.swift
//  chatKinder
//
//  Created by Azizbek Salimov on 26.05.2022.
//

import Foundation
import Apollo
import ApolloWebSocket

// MARK: - Singleton Wrapper

class Network {
  static let shared = Network()
    
  /// A web socket transport to use for subscriptions
  private lazy var webSocketTransport: WebSocketTransport = {
    let url = URL(string: "http://192.168.0.97:4010/graphql")!
    let webSocketClient = WebSocket(url: url, protocol: .graphql_transport_ws)
    return WebSocketTransport(websocket: webSocketClient)
  }()
  
  /// An HTTP transport to use for queries and mutations
  private lazy var normalTransport: RequestChainNetworkTransport = {
    let url = URL(string: "http://192.168.0.97:4010/graphql")!
    return RequestChainNetworkTransport(interceptorProvider: DefaultInterceptorProvider(store: self.store), endpointURL: url)
  }()

  /// A split network transport to allow the use of both of the above
  /// transports through a single `NetworkTransport` instance.
  private lazy var splitNetworkTransport = SplitNetworkTransport(
    uploadingNetworkTransport: self.normalTransport,
    webSocketNetworkTransport: self.webSocketTransport
  )

  /// Create a client using the `SplitNetworkTransport`.
  private(set) lazy var apollo = ApolloClient(networkTransport: self.splitNetworkTransport, store: self.store)

  /// A common store to use for `normalTransport` and `client`.
  private lazy var store = ApolloStore()
}
