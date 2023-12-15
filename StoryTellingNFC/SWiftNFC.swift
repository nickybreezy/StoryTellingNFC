import CoreNFC

class SWiftNFC: NSObject, NFCNDEFReaderSessionDelegate {
    var onRead: ((String) -> Void)?

    func read() {
        guard NFCNDEFReaderSession.readingAvailable else {
            print("NFC reading not available")
            return
        }

        let session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: false)
        session.alertMessage = "Hold your iPhone near the tag."
        session.begin()
    }

    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        let msg = messages.map {
            $0.records.map {
                String(decoding: $0.payload, as: UTF8.self)
            }.joined(separator: "\n")
        }.joined(separator: " ")

        onRead?(msg)
        session.invalidate()
    }

    func readerSessionDidBecomeActive(_ session: NFCNDEFReaderSession) {
        // Handle session becoming active if needed
    }

    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        // Handle session invalidation with error if needed
    }
}
