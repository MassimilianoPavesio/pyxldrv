# *-* encoding: utf-8 *-*

from libc.string cimport memset
from libc.stdlib cimport malloc, free


cdef extern from "vxlapi.h":

    # defines for the supported hardware
    int _XL_HWTYPE_NONE                                   "XL_HWTYPE_NONE"
    int _XL_HWTYPE_VIRTUAL                                "XL_HWTYPE_VIRTUAL"
    int _XL_HWTYPE_CANCARDX                               "XL_HWTYPE_CANCARDX"
    int _XL_HWTYPE_CANAC2PCI                              "XL_HWTYPE_CANAC2PCI"
    int _XL_HWTYPE_CANCARDY                               "XL_HWTYPE_CANCARDY"
    int _XL_HWTYPE_CANCARDXL                              "XL_HWTYPE_CANCARDXL"
    int _XL_HWTYPE_CANCASEXL                              "XL_HWTYPE_CANCASEXL"
    int _XL_HWTYPE_CANCASEXL_LOG_OBSOLETE                 "XL_HWTYPE_CANCASEXL_LOG_OBSOLETE"
    int _XL_HWTYPE_CANBOARDXL                             "XL_HWTYPE_CANBOARDXL"
    int _XL_HWTYPE_CANBOARDXL_PXI                         "XL_HWTYPE_CANBOARDXL_PXI"
    int _XL_HWTYPE_VN2600                                 "XL_HWTYPE_VN2600"
    int _XL_HWTYPE_VN2610                                 "XL_HWTYPE_VN2610"
    int _XL_HWTYPE_VN3300                                 "XL_HWTYPE_VN3300"
    int _XL_HWTYPE_VN3600                                 "XL_HWTYPE_VN3600"
    int _XL_HWTYPE_VN7600                                 "XL_HWTYPE_VN7600"
    int _XL_HWTYPE_CANCARDXLE                             "XL_HWTYPE_CANCARDXLE"
    int _XL_HWTYPE_VN8900                                 "XL_HWTYPE_VN8900"
    int _XL_HWTYPE_VN8950                                 "XL_HWTYPE_VN8950"
    int _XL_HWTYPE_VN2640                                 "XL_HWTYPE_VN2640"
    int _XL_HWTYPE_VN1610                                 "XL_HWTYPE_VN1610"
    int _XL_HWTYPE_VN1630                                 "XL_HWTYPE_VN1630"
    int _XL_HWTYPE_VN1640                                 "XL_HWTYPE_VN1640"
    int _XL_HWTYPE_VN8970                                 "XL_HWTYPE_VN8970"
    int _XL_HWTYPE_VN1611                                 "XL_HWTYPE_VN1611"
    int _XL_HWTYPE_VN5240                                 "XL_HWTYPE_VN5240"
    int _XL_HWTYPE_VN5610                                 "XL_HWTYPE_VN5610"
    int _XL_HWTYPE_VN5620                                 "XL_HWTYPE_VN5620"
    int _XL_HWTYPE_VN7570                                 "XL_HWTYPE_VN7570"
    int _XL_HWTYPE_VN5650                                 "XL_HWTYPE_VN5650"
    int _XL_HWTYPE_IPCLIENT                               "XL_HWTYPE_IPCLIENT"
    int _XL_HWTYPE_IPSERVER                               "XL_HWTYPE_IPSERVER"
    int _XL_HWTYPE_VX1121                                 "XL_HWTYPE_VX1121"
    int _XL_HWTYPE_VX1131                                 "XL_HWTYPE_VX1131"
    int _XL_HWTYPE_VT6204                                 "XL_HWTYPE_VT6204"
    int _XL_HWTYPE_VN1630_LOG                             "XL_HWTYPE_VN1630_LOG"
    int _XL_HWTYPE_VN7610                                 "XL_HWTYPE_VN7610"
    int _XL_HWTYPE_VN7572                                 "XL_HWTYPE_VN7572"
    int _XL_HWTYPE_VN8972                                 "XL_HWTYPE_VN8972"
    int _XL_HWTYPE_VN0601                                 "XL_HWTYPE_VN0601"
    int _XL_HWTYPE_VN5640                                 "XL_HWTYPE_VN5640"
    int _XL_HWTYPE_VX0312                                 "XL_HWTYPE_VX0312"
    int _XL_HWTYPE_VH6501                                 "XL_HWTYPE_VH6501"
    int _XL_HWTYPE_VN8800                                 "XL_HWTYPE_VN8800"
    int _XL_HWTYPE_IPCL8800                               "XL_HWTYPE_IPCL8800"
    int _XL_HWTYPE_IPSRV8800                              "XL_HWTYPE_IPSRV8800"
    int _XL_HWTYPE_CSMCAN                                 "XL_HWTYPE_CSMCAN"
    int _XL_HWTYPE_VN5610A                                "XL_HWTYPE_VN5610A"
    int _XL_HWTYPE_VN7640                                 "XL_HWTYPE_VN7640"
    int _XL_HWTYPE_VX1135                                 "XL_HWTYPE_VX1135"
    int _XL_HWTYPE_VN4610                                 "XL_HWTYPE_VN4610"
    int _XL_HWTYPE_VT6306                                 "XL_HWTYPE_VT6306"
    int _XL_HWTYPE_VT6104A                                "XL_HWTYPE_VT6104A"
    int _XL_HWTYPE_VN5430                                 "XL_HWTYPE_VN5430"
    int _XL_HWTYPE_VTSSERVICE                             "XL_HWTYPE_VTSSERVICE"
    int _XL_HWTYPE_VN1530                                 "XL_HWTYPE_VN1530"
    int _XL_HWTYPE_VN1531                                 "XL_HWTYPE_VN1531"
    int _XL_HWTYPE_VX1161A                                "XL_HWTYPE_VX1161A"
    int _XL_HWTYPE_VX1161B                                "XL_HWTYPE_VX1161B"
    int _XL_MAX_HWTYPE                                    "XL_MAX_HWTYPE"

    # Bus types
    int _XL_BUS_TYPE_NONE                                 "XL_BUS_TYPE_NONE"
    int _XL_BUS_TYPE_CAN                                  "XL_BUS_TYPE_CAN"
    int _XL_BUS_TYPE_LIN                                  "XL_BUS_TYPE_LIN"
    int _XL_BUS_TYPE_FLEXRAY                              "XL_BUS_TYPE_FLEXRAY"
    int _XL_BUS_TYPE_AFDX                                 "XL_BUS_TYPE_AFDX"
    int _XL_BUS_TYPE_MOST                                 "XL_BUS_TYPE_MOST"
    int _XL_BUS_TYPE_DAIO                                 "XL_BUS_TYPE_DAIO"
    int _XL_BUS_TYPE_J1708                                "XL_BUS_TYPE_J1708"
    int _XL_BUS_TYPE_KLINE                                "XL_BUS_TYPE_KLINE"
    int _XL_BUS_TYPE_ETHERNET                             "XL_BUS_TYPE_ETHERNET"
    int _XL_BUS_TYPE_A429                                 "XL_BUS_TYPE_A429"
    
    # interface version for our events
    int _XL_INTERFACE_VERSION_V2                          "XL_INTERFACE_VERSION_V2"
    int _XL_INTERFACE_VERSION_V3                          "XL_INTERFACE_VERSION_V3"
    int _XL_INTERFACE_VERSION_V4                          "XL_INTERFACE_VERSION_V4"
    #current version
    int _XL_INTERFACE_VERSION                             "XL_INTERFACE_VERSION"
    
    # porthandle
    int _XL_INVALID_PORTHANDLE                            "XL_INVALID_PORTHANDLE"
    
    # CAN operation modes
    int _XL_BUS_PARAMS_CANOPMODE_CAN20                    "XL_BUS_PARAMS_CANOPMODE_CAN20"
    int _XL_BUS_PARAMS_CANOPMODE_CANFD                    "XL_BUS_PARAMS_CANOPMODE_CANFD"
    int _XL_BUS_PARAMS_CANOPMODE_CANFD_NO_ISO             "XL_BUS_PARAMS_CANOPMODE_CANFD_NO_ISO"
    
    # defines for XL_A429_PARAMS::channelDirection
    int _XL_A429_MSG_CHANNEL_DIR_TX                       "XL_A429_MSG_CHANNEL_DIR_TX"
    int _XL_A429_MSG_CHANNEL_DIR_RX                       "XL_A429_MSG_CHANNEL_DIR_RX"

    # to be used with XL_A429_PARAMS::data::tx::bitrate
    int _XL_A429_MSG_BITRATE_SLOW_MIN                     "XL_A429_MSG_BITRATE_SLOW_MIN"
    int _XL_A429_MSG_BITRATE_SLOW_MAX                     "XL_A429_MSG_BITRATE_SLOW_MAX"
    int _XL_A429_MSG_BITRATE_FAST_MIN                     "XL_A429_MSG_BITRATE_FAST_MIN"
    int _XL_A429_MSG_BITRATE_FAST_MAX                     "XL_A429_MSG_BITRATE_FAST_MAX"

    # to be used with XL_A429_PARAMS::data::tx/rx::minGap
    int _XL_A429_MSG_GAP_4BIT                             "XL_A429_MSG_GAP_4BIT"

    # to be used with XL_A429_PARAMS::rx::minBitrate/maxBitrate
    int _XL_A429_MSG_BITRATE_RX_MIN                       "XL_A429_MSG_BITRATE_RX_MIN"
    int _XL_A429_MSG_BITRATE_RX_MAX                       "XL_A429_MSG_BITRATE_RX_MAX"

    # to be used with XL_A429_PARAMS::rx::autoBaudrate
    int _XL_A429_MSG_AUTO_BAUDRATE_DISABLED               "XL_A429_MSG_AUTO_BAUDRATE_DISABLED"
    int _XL_A429_MSG_AUTO_BAUDRATE_ENABLED                "XL_A429_MSG_AUTO_BAUDRATE_ENABLED"

    # to be used with XL_A429_TX_MSG::flags
    int _XL_A429_MSG_FLAG_ON_REQUEST                      "XL_A429_MSG_FLAG_ON_REQUEST"
    int _XL_A429_MSG_FLAG_CYCLIC                          "XL_A429_MSG_FLAG_CYCLIC"
    int _XL_A429_MSG_FLAG_DELETE_CYCLIC                   "XL_A429_MSG_FLAG_DELETE_CYCLIC"

    # to be used with XL_A429_TX_MSG::cycleTime
    int _XL_A429_MSG_CYCLE_MAX                            "XL_A429_MSG_CYCLE_MAX"

    # to be used with XL_A429_TX_MSG::gap
    int _XL_A429_MSG_GAP_DEFAULT                          "XL_A429_MSG_GAP_DEFAULT"
    int _XL_A429_MSG_GAP_MAX                              "XL_A429_MSG_GAP_MAX"

    # to be used with XL_A429_PARAMS::data::parity
    # to be used with XL_A429_TX_MSG::parity
    int _XL_A429_MSG_PARITY_DEFAULT                       "XL_A429_MSG_PARITY_DEFAULT"
    int _XL_A429_MSG_PARITY_DISABLED                      "XL_A429_MSG_PARITY_DISABLED"
    int _XL_A429_MSG_PARITY_ODD                           "XL_A429_MSG_PARITY_ODD"
    int _XL_A429_MSG_PARITY_EVEN                          "XL_A429_MSG_PARITY_EVEN"
    int _XL_A429_EV_TX_MSG_CTRL_ON_REQUEST                "XL_A429_EV_TX_MSG_CTRL_ON_REQUEST"
    int _XL_A429_EV_TX_MSG_CTRL_CYCLIC                    "XL_A429_EV_TX_MSG_CTRL_CYCLIC"
    int _XL_A429_EV_TX_ERROR_ACCESS_DENIED                "XL_A429_EV_TX_ERROR_ACCESS_DENIED"
    int _XL_A429_EV_TX_ERROR_TRANSMISSION_ERROR           "XL_A429_EV_TX_ERROR_TRANSMISSION_ERROR"
    int _XL_A429_EV_RX_ERROR_GAP_VIOLATION                "XL_A429_EV_RX_ERROR_GAP_VIOLATION"
    int _XL_A429_EV_RX_ERROR_PARITY                       "XL_A429_EV_RX_ERROR_PARITY"
    int _XL_A429_EV_RX_ERROR_BITRATE_LOW                  "XL_A429_EV_RX_ERROR_BITRATE_LOW"
    int _XL_A429_EV_RX_ERROR_BITRATE_HIGH                 "XL_A429_EV_RX_ERROR_BITRATE_HIGH"
    int _XL_A429_EV_RX_ERROR_FRAME_FORMAT                 "XL_A429_EV_RX_ERROR_FRAME_FORMAT"
    int _XL_A429_EV_RX_ERROR_CODING_RZ                    "XL_A429_EV_RX_ERROR_CODING_RZ"
    int _XL_A429_EV_RX_ERROR_DUTY_FACTOR                  "XL_A429_EV_RX_ERROR_DUTY_FACTOR"
    int _XL_A429_EV_RX_ERROR_AVG_BIT_LENGTH               "XL_A429_EV_RX_ERROR_AVG_BIT_LENGTH"
    int _XL_A429_QUEUE_OVERFLOW                           "XL_A429_QUEUE_OVERFLOW"
    int _XL_A429_RX_FIFO_QUEUE_SIZE_MAX                   "XL_A429_RX_FIFO_QUEUE_SIZE_MAX"
    int _XL_A429_RX_FIFO_QUEUE_SIZE_MIN                   "XL_A429_RX_FIFO_QUEUE_SIZE_MIN"
    
    # Common Error Codes
    int _XL_SUCCESS                                       "XL_SUCCESS"
    int _XL_PENDING                                       "XL_PENDING"
    int _XL_ERR_QUEUE_IS_EMPTY                            "XL_ERR_QUEUE_IS_EMPTY"
    int _XL_ERR_QUEUE_IS_FULL                             "XL_ERR_QUEUE_IS_FULL"
    int _XL_ERR_TX_NOT_POSSIBLE                           "XL_ERR_TX_NOT_POSSIBLE"
    int _XL_ERR_NO_LICENSE                                "XL_ERR_NO_LICENSE"
    int _XL_ERR_WRONG_PARAMETER                           "XL_ERR_WRONG_PARAMETER"
    int _XL_ERR_TWICE_REGISTER                            "XL_ERR_TWICE_REGISTER"
    int _XL_ERR_INVALID_CHAN_INDEX                        "XL_ERR_INVALID_CHAN_INDEX"
    int _XL_ERR_INVALID_ACCESS                            "XL_ERR_INVALID_ACCESS"
    int _XL_ERR_PORT_IS_OFFLINE                           "XL_ERR_PORT_IS_OFFLINE"
    int _XL_ERR_CHAN_IS_ONLINE                            "XL_ERR_CHAN_IS_ONLINE"
    int _XL_ERR_NOT_IMPLEMENTED                           "XL_ERR_NOT_IMPLEMENTED"
    int _XL_ERR_INVALID_PORT                              "XL_ERR_INVALID_PORT"
    int _XL_ERR_HW_NOT_READY                              "XL_ERR_HW_NOT_READY"
    int _XL_ERR_CMD_TIMEOUT                               "XL_ERR_CMD_TIMEOUT"
    int _XL_ERR_CMD_HANDLING                              "XL_ERR_CMD_HANDLING"
    int _XL_ERR_HW_NOT_PRESENT                            "XL_ERR_HW_NOT_PRESENT"
    int _XL_ERR_NOTIFY_ALREADY_ACTIVE                     "XL_ERR_NOTIFY_ALREADY_ACTIVE"
    int _XL_ERR_INVALID_TAG                               "XL_ERR_INVALID_TAG"
    int _XL_ERR_INVALID_RESERVED_FLD                      "XL_ERR_INVALID_RESERVED_FLD"
    int _XL_ERR_INVALID_SIZE                              "XL_ERR_INVALID_SIZE"
    int _XL_ERR_INSUFFICIENT_BUFFER                       "XL_ERR_INSUFFICIENT_BUFFER"
    int _XL_ERR_ERROR_CRC                                 "XL_ERR_ERROR_CRC"
    int _XL_ERR_NOT_FOUND                                 "XL_ERR_NOT_FOUND"
    int _XL_ERR_REQ_NOT_ACCEP                             "XL_ERR_REQ_NOT_ACCEP"
    int _XL_ERR_INVALID_LEVEL                             "XL_ERR_INVALID_LEVEL"
    int _XL_ERR_NO_DATA_DETECTED                          "XL_ERR_NO_DATA_DETECTED"
    int _XL_ERR_INTERNAL_ERROR                            "XL_ERR_INTERNAL_ERROR"
    int _XL_ERR_INVALID_USER_BUFFER                       "XL_ERR_INVALID_USER_BUFFER"
    int _XL_ERR_INVALID_PORT_ACCESS_TYPE                  "XL_ERR_INVALID_PORT_ACCESS_TYPE"
    int _XL_ERR_NO_RESOURCES                              "XL_ERR_NO_RESOURCES"
    int _XL_ERR_WRONG_CHIP_TYPE                           "XL_ERR_WRONG_CHIP_TYPE"
    int _XL_ERR_WRONG_COMMAND                             "XL_ERR_WRONG_COMMAND"
    int _XL_ERR_INVALID_HANDLE                            "XL_ERR_INVALID_HANDLE"
    int _XL_ERR_RESERVED_NOT_ZERO                         "XL_ERR_RESERVED_NOT_ZERO"
    int _XL_ERR_INIT_ACCESS_MISSING                       "XL_ERR_INIT_ACCESS_MISSING"
    int _XL_ERR_WRONG_VERSION                             "XL_ERR_WRONG_VERSION"
    int _XL_ERR_CANNOT_OPEN_DRIVER                        "XL_ERR_CANNOT_OPEN_DRIVER"
    int _XL_ERR_WRONG_BUS_TYPE                            "XL_ERR_WRONG_BUS_TYPE"
    int _XL_ERR_DLL_NOT_FOUND                             "XL_ERR_DLL_NOT_FOUND"
    int _XL_ERR_INVALID_CHANNEL_MASK                      "XL_ERR_INVALID_CHANNEL_MASK"
    int _XL_ERR_NOT_SUPPORTED                             "XL_ERR_NOT_SUPPORTED"
    int _XL_ERR_CONNECTION_BROKEN                         "XL_ERR_CONNECTION_BROKEN"
    int _XL_ERR_CONNECTION_CLOSED                         "XL_ERR_CONNECTION_CLOSED"
    int _XL_ERR_INVALID_STREAM_NAME                       "XL_ERR_INVALID_STREAM_NAME"
    int _XL_ERR_CONNECTION_FAILED                         "XL_ERR_CONNECTION_FAILED"
    int _XL_ERR_STREAM_NOT_FOUND                          "XL_ERR_STREAM_NOT_FOUND"
    int _XL_ERR_STREAM_NOT_CONNECTED                      "XL_ERR_STREAM_NOT_CONNECTED"
    int _XL_ERR_QUEUE_OVERRUN                             "XL_ERR_QUEUE_OVERRUN"
    int _XL_ERROR                                         "XL_ERROR"

    # CAN FD Error Codes
    int _XL_ERR_INVALID_DLC                               "XL_ERR_INVALID_DLC"
    int _XL_ERR_INVALID_CANID                             "XL_ERR_INVALID_CANID"
    int _XL_ERR_INVALID_FDFLAG_MODE20                     "XL_ERR_INVALID_FDFLAG_MODE20"
    int _XL_ERR_EDL_RTR                                   "XL_ERR_EDL_RTR"
    int _XL_ERR_EDL_NOT_SET                               "XL_ERR_EDL_NOT_SET"
    int _XL_ERR_UNKNOWN_FLAG                              "XL_ERR_UNKNOWN_FLAG"

    # FlexRay Error Codes
    int _XL_ERR_PDU_OUT_OF_MEMORY                         "XL_ERR_PDU_OUT_OF_MEMORY"
    int _XL_ERR_FR_CLUSTERCONFIG_MISSING                  "XL_ERR_FR_CLUSTERCONFIG_MISSING"
    int _XL_ERR_PDU_OFFSET_REPET_INVALID                  "XL_ERR_PDU_OFFSET_REPET_INVALID"
    int _XL_ERR_PDU_PAYLOAD_SIZE_INVALID                  "XL_ERR_PDU_PAYLOAD_SIZE_INVALID"
    int _XL_ERR_FR_NBR_FRAMES_OVERFLOW                    "XL_ERR_FR_NBR_FRAMES_OVERFLOW"
    int _XL_ERR_FR_SLOT_ID_INVALID                        "XL_ERR_FR_SLOT_ID_INVALID"
    int _XL_ERR_FR_SLOT_ALREADY_OCCUPIED_BY_ERAY          "XL_ERR_FR_SLOT_ALREADY_OCCUPIED_BY_ERAY"
    int _XL_ERR_FR_SLOT_OCCUPIED_BY_OTHER_APP             "XL_ERR_FR_SLOT_OCCUPIED_BY_OTHER_APP"
    int _XL_ERR_FR_SLOT_IN_WRONG_SEGMENT                  "XL_ERR_FR_SLOT_IN_WRONG_SEGMENT"
    int _XL_ERR_FR_FRAME_CYCLE_MULTIPLEX_ERROR            "XL_ERR_FR_FRAME_CYCLE_MULTIPLEX_ERROR"
    int _XL_ERR_PDU_NO_UNMAP_OF_SYNCFRAME                 "XL_ERR_PDU_NO_UNMAP_OF_SYNCFRAME"
    int _XL_ERR_SYNC_FRAME_MODE                           "XL_ERR_SYNC_FRAME_MODE"

    # Ethernet Error Codes
    int _XL_ERR_ETH_PHY_ACTIVATION_FAILED                 "XL_ERR_ETH_PHY_ACTIVATION_FAILED"
    int _XL_ERR_ETH_PHY_CONFIG_ABORTED                    "XL_ERR_ETH_PHY_CONFIG_ABORTED"
    int _XL_ERR_ETH_RESET_FAILED                          "XL_ERR_ETH_RESET_FAILED"
    int _XL_ERR_ETH_SET_CONFIG_DELAYED                    "XL_ERR_ETH_SET_CONFIG_DELAYED"
    int _XL_ERR_ETH_UNSUPPORTED_FEATURE                   "XL_ERR_ETH_UNSUPPORTED_FEATURE"
    int _XL_ERR_ETH_MAC_ACTIVATION_FAILED                 "XL_ERR_ETH_MAC_ACTIVATION_FAILED"
    int _XL_ERR_NET_ETH_SWITCH_IS_ONLINE                  "XL_ERR_NET_ETH_SWITCH_IS_ONLINE"

    # flags for channelCapabilities
    # Time-Sync
    int _XL_CHANNEL_FLAG_TIME_SYNC_RUNNING                "XL_CHANNEL_FLAG_TIME_SYNC_RUNNING"
    int _XL_CHANNEL_FLAG_NO_HWSYNC_SUPPORT                "XL_CHANNEL_FLAG_NO_HWSYNC_SUPPORT"
    # used to distinguish between VN2600 (w/o SPDIF) and VN2610 (with S/PDIF) 
    int _XL_CHANNEL_FLAG_SPDIF_CAPABLE                    "XL_CHANNEL_FLAG_SPDIF_CAPABLE"
    int _XL_CHANNEL_FLAG_CANFD_BOSCH_SUPPORT              "XL_CHANNEL_FLAG_CANFD_BOSCH_SUPPORT"
    int _XL_CHANNEL_FLAG_CMACTLICENSE_SUPPORT             "XL_CHANNEL_FLAG_CMACTLICENSE_SUPPORT"
    int _XL_CHANNEL_FLAG_CANFD_ISO_SUPPORT                "XL_CHANNEL_FLAG_CANFD_ISO_SUPPORT"

    # activate - channel flags
    int _XL_ACTIVATE_NONE                                 "XL_ACTIVATE_NONE"                     
    int _XL_ACTIVATE_RESET_CLOCK                          "XL_ACTIVATE_RESET_CLOCK"  
    
    int _XL_CAN_EXT_MSG_ID                                "XL_CAN_EXT_MSG_ID"
    int _XL_CAN_MSG_FLAG_ERROR_FRAME                      "XL_CAN_MSG_FLAG_ERROR_FRAME"
    int _XL_CAN_MSG_FLAG_OVERRUN                          "XL_CAN_MSG_FLAG_OVERRUN"
    int _XL_CAN_MSG_FLAG_NERR                             "XL_CAN_MSG_FLAG_NERR"
    int _XL_CAN_MSG_FLAG_WAKEUP                           "XL_CAN_MSG_FLAG_WAKEUP"
    int _XL_CAN_MSG_FLAG_REMOTE_FRAME                     "XL_CAN_MSG_FLAG_REMOTE_FRAME"
    int _XL_CAN_MSG_FLAG_RESERVED_1                       "XL_CAN_MSG_FLAG_RESERVED_1"
    int _XL_CAN_MSG_FLAG_TX_COMPLETED                     "XL_CAN_MSG_FLAG_TX_COMPLETED"
    int _XL_CAN_MSG_FLAG_TX_REQUEST                       "XL_CAN_MSG_FLAG_TX_REQUEST"
    int _XL_CAN_MSG_FLAG_SRR_BIT_DOM                      "XL_CAN_MSG_FLAG_SRR_BIT_DOM"
    int _XL_EVENT_FLAG_OVERRUN                            "XL_EVENT_FLAG_OVERRUN"
    int _XL_LIN_MSGFLAG_TX                                "XL_LIN_MSGFLAG_TX"
    int _XL_LIN_MSGFLAG_CRCERROR                          "XL_LIN_MSGFLAG_CRCERROR"    
    
    unsigned long _XL_SET_TIMESYNC_NO_CHANGE              "XL_SET_TIMESYNC_NO_CHANGE"
    unsigned long _XL_SET_TIMESYNC_ON                     "XL_SET_TIMESYNC_ON"
    unsigned long _XL_SET_TIMESYNC_OFF                    "XL_SET_TIMESYNC_OFF"  

    int _XL_CAN_TXMSG_FLAG_EDL                            "XL_CAN_TXMSG_FLAG_EDL"
    int _XL_CAN_TXMSG_FLAG_BRS                            "XL_CAN_TXMSG_FLAG_BRS"
    int _XL_CAN_TXMSG_FLAG_RTR                            "XL_CAN_TXMSG_FLAG_RTR" 
    int _XL_CAN_TXMSG_FLAG_HIGHPRIO                       "XL_CAN_TXMSG_FLAG_HIGHPRIO"
    int _XL_CAN_TXMSG_FLAG_WAKEUP                         "XL_CAN_TXMSG_FLAG_WAKEUP"
    
    unsigned short _XL_CAN_EV_TAG_TX_MSG                  "XL_CAN_EV_TAG_TX_MSG"

    int _XL_BUS_COMPATIBLE_CAN                            "XL_BUS_COMPATIBLE_CAN"               
    int _XL_BUS_COMPATIBLE_LIN                            "XL_BUS_COMPATIBLE_LIN"               
    int _XL_BUS_COMPATIBLE_FLEXRAY                        "XL_BUS_COMPATIBLE_FLEXRAY"           
    int _XL_BUS_COMPATIBLE_MOST                           "XL_BUS_COMPATIBLE_MOST"              
    int _XL_BUS_COMPATIBLE_DAIO                           "XL_BUS_COMPATIBLE_DAIO"              
    int _XL_BUS_COMPATIBLE_J1708                          "XL_BUS_COMPATIBLE_J1708"             
    int _XL_BUS_COMPATIBLE_KLINE                          "XL_BUS_COMPATIBLE_KLINE"             
    int _XL_BUS_COMPATIBLE_ETHERNET                       "XL_BUS_COMPATIBLE_ETHERNET"          
    int _XL_BUS_COMPATIBLE_A429                           "XL_BUS_COMPATIBLE_A429"              

    # the following bus types can be used with the current cab / piggy  
    int _XL_BUS_ACTIVE_CAP_CAN                            "XL_BUS_ACTIVE_CAP_CAN"                
    int _XL_BUS_ACTIVE_CAP_LIN                            "XL_BUS_ACTIVE_CAP_LIN"                
    int _XL_BUS_ACTIVE_CAP_FLEXRAY                        "XL_BUS_ACTIVE_CAP_FLEXRAY"            
    int _XL_BUS_ACTIVE_CAP_MOST                           "XL_BUS_ACTIVE_CAP_MOST"               
    int _XL_BUS_ACTIVE_CAP_DAIO                           "XL_BUS_ACTIVE_CAP_DAIO"               
    int _XL_BUS_ACTIVE_CAP_J1708                          "XL_BUS_ACTIVE_CAP_J1708"              
    int _XL_BUS_ACTIVE_CAP_KLINE                          "XL_BUS_ACTIVE_CAP_KLINE"              
    int _XL_BUS_ACTIVE_CAP_ETHERNET                       "XL_BUS_ACTIVE_CAP_ETHERNET"           
    int _XL_BUS_ACTIVE_CAP_A429                           "XL_BUS_ACTIVE_CAP_A429"  

    # defines for XLfrChannelConfig::status and XLbusParams::data::flexray::status 
    int _XL_FR_CHANNEL_CFG_STATUS_INIT_APP_PRESENT        "XL_FR_CHANNEL_CFG_STATUS_INIT_APP_PRESENT"
    int _XL_FR_CHANNEL_CFG_STATUS_CHANNEL_ACTIVATED       "XL_FR_CHANNEL_CFG_STATUS_CHANNEL_ACTIVATED"
    int _XL_FR_CHANNEL_CFG_STATUS_VALID_CLUSTER_CFG       "XL_FR_CHANNEL_CFG_STATUS_VALID_CLUSTER_CFG"
    int _XL_FR_CHANNEL_CFG_STATUS_VALID_CFG_MODE          "XL_FR_CHANNEL_CFG_STATUS_VALID_CFG_MODE"

    # defines for XLfrChannelConfig::cfgMode and XLbusParams::data::flexray::cfgMode 
    int _XL_FR_CHANNEL_CFG_MODE_SYNCHRONOUS               "XL_FR_CHANNEL_CFG_MODE_SYNCHRONOUS"
    int _XL_FR_CHANNEL_CFG_MODE_COMBINED                  "XL_FR_CHANNEL_CFG_MODE_COMBINED"
    int _XL_FR_CHANNEL_CFG_MODE_ASYNCHRONOUS              "XL_FR_CHANNEL_CFG_MODE_ASYNCHRONOUS"

    # T_XL_ETH_CHANNEL_STATUS.activeConnector
    int _XL_ETH_STATUS_CONNECTOR_DEFAULT                  "XL_ETH_STATUS_CONNECTOR_DEFAULT"
    int _XL_ETH_STATUS_CONNECTOR_RJ45                     "XL_ETH_STATUS_CONNECTOR_RJ45"
    int _XL_ETH_STATUS_CONNECTOR_DSUB                     "XL_ETH_STATUS_CONNECTOR_DSUB"

    # T_XL_ETH_CHANNEL_STATUS.activePhy
    int _XL_ETH_STATUS_PHY_UNKNOWN                        "XL_ETH_STATUS_PHY_UNKNOWN"
    int _XL_ETH_STATUS_PHY_IEEE_802_3                     "XL_ETH_STATUS_PHY_IEEE_802_3"
    int _XL_ETH_STATUS_PHY_BROADR_REACH                   "XL_ETH_STATUS_PHY_BROADR_REACH"
    int _XL_ETH_STATUS_PHY_100BASE_T1                     "XL_ETH_STATUS_PHY_100BASE_T1"
    int _XL_ETH_STATUS_PHY_1000BASE_T1                    "XL_ETH_STATUS_PHY_1000BASE_T1"

    # T_XL_ETH_CHANNEL_STATUS.link
    int _XL_ETH_STATUS_LINK_UNKNOWN                       "XL_ETH_STATUS_LINK_UNKNOWN"
    int _XL_ETH_STATUS_LINK_DOWN                          "XL_ETH_STATUS_LINK_DOWN"
    int _XL_ETH_STATUS_LINK_UP                            "XL_ETH_STATUS_LINK_UP"
    int _XL_ETH_STATUS_LINK_ERROR                         "XL_ETH_STATUS_LINK_ERROR"

    # T_XL_ETH_CHANNEL_STATUS.speed
    int _XL_ETH_STATUS_SPEED_UNKNOWN                      "XL_ETH_STATUS_SPEED_UNKNOWN"
    int _XL_ETH_STATUS_SPEED_10                           "XL_ETH_STATUS_SPEED_10"
    int _XL_ETH_STATUS_SPEED_100                          "XL_ETH_STATUS_SPEED_100"
    int _XL_ETH_STATUS_SPEED_1000                         "XL_ETH_STATUS_SPEED_1000"
    int _XL_ETH_STATUS_SPEED_2500                         "XL_ETH_STATUS_SPEED_2500"
    int _XL_ETH_STATUS_SPEED_5000                         "XL_ETH_STATUS_SPEED_5000"
    int _XL_ETH_STATUS_SPEED_10000                        "XL_ETH_STATUS_SPEED_10000"

    # T_XL_ETH_CHANNEL_STATUS.clockMode
    int _XL_ETH_STATUS_CLOCK_DONT_CARE                    "XL_ETH_STATUS_CLOCK_DONT_CARE"
    int _XL_ETH_STATUS_CLOCK_MASTER                       "XL_ETH_STATUS_CLOCK_MASTER"
    int _XL_ETH_STATUS_CLOCK_SLAVE                        "XL_ETH_STATUS_CLOCK_SLAVE"

    # Bypass values
    int _XL_ETH_BYPASS_INACTIVE                           "XL_ETH_BYPASS_INACTIVE"
    int _XL_ETH_BYPASS_PHY                                "XL_ETH_BYPASS_PHY"
    int _XL_ETH_BYPASS_MACCORE                            "XL_ETH_BYPASS_MACCORE"


    # Transceiver types
    # CAN Cab
    int _XL_TRANSCEIVER_TYPE_NONE                         "XL_TRANSCEIVER_TYPE_NONE"
    int _XL_TRANSCEIVER_TYPE_CAN_251                      "XL_TRANSCEIVER_TYPE_CAN_251"
    int _XL_TRANSCEIVER_TYPE_CAN_252                      "XL_TRANSCEIVER_TYPE_CAN_252"
    int _XL_TRANSCEIVER_TYPE_CAN_DNOPTO                   "XL_TRANSCEIVER_TYPE_CAN_DNOPTO"
    int _XL_TRANSCEIVER_TYPE_CAN_SWC_PROTO                "XL_TRANSCEIVER_TYPE_CAN_SWC_PROTO"
    int _XL_TRANSCEIVER_TYPE_CAN_SWC                      "XL_TRANSCEIVER_TYPE_CAN_SWC"
    int _XL_TRANSCEIVER_TYPE_CAN_EVA                      "XL_TRANSCEIVER_TYPE_CAN_EVA"
    int _XL_TRANSCEIVER_TYPE_CAN_FIBER                    "XL_TRANSCEIVER_TYPE_CAN_FIBER"
    int _XL_TRANSCEIVER_TYPE_CAN_1054_OPTO                "XL_TRANSCEIVER_TYPE_CAN_1054_OPTO"
    int _XL_TRANSCEIVER_TYPE_CAN_SWC_OPTO                 "XL_TRANSCEIVER_TYPE_CAN_SWC_OPTO"
    int _XL_TRANSCEIVER_TYPE_CAN_B10011S                  "XL_TRANSCEIVER_TYPE_CAN_B10011S"
    int _XL_TRANSCEIVER_TYPE_CAN_1050                     "XL_TRANSCEIVER_TYPE_CAN_1050"
    int _XL_TRANSCEIVER_TYPE_CAN_1050_OPTO                "XL_TRANSCEIVER_TYPE_CAN_1050_OPTO"
    int _XL_TRANSCEIVER_TYPE_CAN_1041                     "XL_TRANSCEIVER_TYPE_CAN_1041"
    int _XL_TRANSCEIVER_TYPE_CAN_1041_OPTO                "XL_TRANSCEIVER_TYPE_CAN_1041_OPTO"
    int _XL_TRANSCEIVER_TYPE_CAN_VIRTUAL                  "XL_TRANSCEIVER_TYPE_CAN_VIRTUAL"
    int _XL_TRANSCEIVER_TYPE_LIN_6258_OPTO                "XL_TRANSCEIVER_TYPE_LIN_6258_OPTO"
    int _XL_TRANSCEIVER_TYPE_LIN_6259_OPTO                "XL_TRANSCEIVER_TYPE_LIN_6259_OPTO"
    int _XL_TRANSCEIVER_TYPE_DAIO_8444_OPTO               "XL_TRANSCEIVER_TYPE_DAIO_8444_OPTO"
    int _XL_TRANSCEIVER_TYPE_CAN_1041A_OPTO               "XL_TRANSCEIVER_TYPE_CAN_1041A_OPTO"
    int _XL_TRANSCEIVER_TYPE_LIN_6259_MAG                 "XL_TRANSCEIVER_TYPE_LIN_6259_MAG"
    int _XL_TRANSCEIVER_TYPE_LIN_7259_MAG                 "XL_TRANSCEIVER_TYPE_LIN_7259_MAG"
    int _XL_TRANSCEIVER_TYPE_LIN_7269_MAG                 "XL_TRANSCEIVER_TYPE_LIN_7269_MAG"
    int _XL_TRANSCEIVER_TYPE_CAN_1054_MAG                 "XL_TRANSCEIVER_TYPE_CAN_1054_MAG"
    int _XL_TRANSCEIVER_TYPE_CAN_251_MAG                  "XL_TRANSCEIVER_TYPE_CAN_251_MAG"
    int _XL_TRANSCEIVER_TYPE_CAN_1050_MAG                 "XL_TRANSCEIVER_TYPE_CAN_1050_MAG"
    int _XL_TRANSCEIVER_TYPE_CAN_1040_MAG                 "XL_TRANSCEIVER_TYPE_CAN_1040_MAG"
    int _XL_TRANSCEIVER_TYPE_CAN_1041A_MAG                "XL_TRANSCEIVER_TYPE_CAN_1041A_MAG"
    int _XL_TRANSCEIVER_TYPE_TWIN_CAN_1041A_MAG           "XL_TRANSCEIVER_TYPE_TWIN_CAN_1041A_MAG"
    int _XL_TRANSCEIVER_TYPE_TWIN_LIN_7269_MAG            "XL_TRANSCEIVER_TYPE_TWIN_LIN_7269_MAG"
    int _XL_TRANSCEIVER_TYPE_TWIN_CAN_1041AV2_MAG         "XL_TRANSCEIVER_TYPE_TWIN_CAN_1041AV2_MAG"
    int _XL_TRANSCEIVER_TYPE_TWIN_CAN_1054_1041A_MAG      "XL_TRANSCEIVER_TYPE_TWIN_CAN_1054_1041A_MAG"

    # CAN PiggyBack
    int _XL_TRANSCEIVER_TYPE_PB_CAN_251                   "XL_TRANSCEIVER_TYPE_PB_CAN_251"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_1054                  "XL_TRANSCEIVER_TYPE_PB_CAN_1054"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_251_OPTO              "XL_TRANSCEIVER_TYPE_PB_CAN_251_OPTO"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_SWC                   "XL_TRANSCEIVER_TYPE_PB_CAN_SWC"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_1054_OPTO             "XL_TRANSCEIVER_TYPE_PB_CAN_1054_OPTO"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_SWC_OPTO              "XL_TRANSCEIVER_TYPE_PB_CAN_SWC_OPTO"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_TT_OPTO               "XL_TRANSCEIVER_TYPE_PB_CAN_TT_OPTO"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_1050                  "XL_TRANSCEIVER_TYPE_PB_CAN_1050"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_1050_OPTO             "XL_TRANSCEIVER_TYPE_PB_CAN_1050_OPTO"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_1041                  "XL_TRANSCEIVER_TYPE_PB_CAN_1041"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_1041_OPTO             "XL_TRANSCEIVER_TYPE_PB_CAN_1041_OPTO"
    int _XL_TRANSCEIVER_TYPE_PB_LIN_6258_OPTO             "XL_TRANSCEIVER_TYPE_PB_LIN_6258_OPTO"
    int _XL_TRANSCEIVER_TYPE_PB_LIN_6259_OPTO             "XL_TRANSCEIVER_TYPE_PB_LIN_6259_OPTO"
    int _XL_TRANSCEIVER_TYPE_PB_LIN_6259_MAG              "XL_TRANSCEIVER_TYPE_PB_LIN_6259_MAG"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_1041A_OPTO            "XL_TRANSCEIVER_TYPE_PB_CAN_1041A_OPTO"
    int _XL_TRANSCEIVER_TYPE_PB_LIN_7259_MAG              "XL_TRANSCEIVER_TYPE_PB_LIN_7259_MAG"
    int _XL_TRANSCEIVER_TYPE_PB_LIN_7269_MAG              "XL_TRANSCEIVER_TYPE_PB_LIN_7269_MAG"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_251_MAG               "XL_TRANSCEIVER_TYPE_PB_CAN_251_MAG"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_1050_MAG              "XL_TRANSCEIVER_TYPE_PB_CAN_1050_MAG"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_1040_MAG              "XL_TRANSCEIVER_TYPE_PB_CAN_1040_MAG"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_1041A_MAG             "XL_TRANSCEIVER_TYPE_PB_CAN_1041A_MAG"
    int _XL_TRANSCEIVER_TYPE_PB_DAIO_8444_OPTO            "XL_TRANSCEIVER_TYPE_PB_DAIO_8444_OPTO"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_1054_MAG              "XL_TRANSCEIVER_TYPE_PB_CAN_1054_MAG"
    int _XL_TRANSCEIVER_TYPE_CAN_1051_CAP_FIX             "XL_TRANSCEIVER_TYPE_CAN_1051_CAP_FIX"
    int _XL_TRANSCEIVER_TYPE_DAIO_1021_FIX                "XL_TRANSCEIVER_TYPE_DAIO_1021_FIX"
    int _XL_TRANSCEIVER_TYPE_LIN_7269_CAP_FIX             "XL_TRANSCEIVER_TYPE_LIN_7269_CAP_FIX"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_1051_CAP              "XL_TRANSCEIVER_TYPE_PB_CAN_1051_CAP"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_SWC_7356_CAP          "XL_TRANSCEIVER_TYPE_PB_CAN_SWC_7356_CAP"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_1055_CAP              "XL_TRANSCEIVER_TYPE_PB_CAN_1055_CAP"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_1057_CAP              "XL_TRANSCEIVER_TYPE_PB_CAN_1057_CAP"
    int _XL_TRANSCEIVER_TYPE_A429_HOLT8596_FIX            "XL_TRANSCEIVER_TYPE_A429_HOLT8596_FIX"
    int _XL_TRANSCEIVER_TYPE_A429_HOLT8455_FIX            "XL_TRANSCEIVER_TYPE_A429_HOLT8455_FIX"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_1051HG_CAP            "XL_TRANSCEIVER_TYPE_PB_CAN_1051HG_CAP"
    int _XL_TRANSCEIVER_TYPE_CAN_1057_FIX                 "XL_TRANSCEIVER_TYPE_CAN_1057_FIX"
    int _XL_TRANSCEIVER_TYPE_LIN_7269_FIX                 "XL_TRANSCEIVER_TYPE_LIN_7269_FIX"
    int _XL_TRANSCEIVER_TYPE_PB_CAN_1462BT                "XL_TRANSCEIVER_TYPE_PB_CAN_1462BT"

    # FlexRay PiggyBacks
    int _XL_TRANSCEIVER_TYPE_PB_FR_1080                   "XL_TRANSCEIVER_TYPE_PB_FR_1080"
    int _XL_TRANSCEIVER_TYPE_PB_FR_1080_MAG               "XL_TRANSCEIVER_TYPE_PB_FR_1080_MAG"
    int _XL_TRANSCEIVER_TYPE_PB_FR_1080A_MAG              "XL_TRANSCEIVER_TYPE_PB_FR_1080A_MAG"
    int _XL_TRANSCEIVER_TYPE_PB_FR_1082_CAP               "XL_TRANSCEIVER_TYPE_PB_FR_1082_CAP"
    int _XL_TRANSCEIVER_TYPE_PB_FRC_1082_CAP              "XL_TRANSCEIVER_TYPE_PB_FRC_1082_CAP"
    int _XL_TRANSCEIVER_TYPE_FR_1082_CAP_FIX              "XL_TRANSCEIVER_TYPE_FR_1082_CAP_FIX"
    int _XL_TRANSCEIVER_TYPE_MOST150_ONBOARD              "XL_TRANSCEIVER_TYPE_MOST150_ONBOARD"

    # Ethernet Phys
    int _XL_TRANSCEIVER_TYPE_ETH_BCM54810_FIX             "XL_TRANSCEIVER_TYPE_ETH_BCM54810_FIX"
    int _XL_TRANSCEIVER_TYPE_ETH_AR8031_FIX               "XL_TRANSCEIVER_TYPE_ETH_AR8031_FIX"
    int _XL_TRANSCEIVER_TYPE_ETH_BCM89810_FIX             "XL_TRANSCEIVER_TYPE_ETH_BCM89810_FIX"
    int _XL_TRANSCEIVER_TYPE_ETH_TJA1100_FIX              "XL_TRANSCEIVER_TYPE_ETH_TJA1100_FIX"
    int _XL_TRANSCEIVER_TYPE_ETH_BCM54810_89811_FIX       "XL_TRANSCEIVER_TYPE_ETH_BCM54810_89811_FIX"
    int _XL_TRANSCEIVER_TYPE_ETH_DP83XG710Q1_FIX          "XL_TRANSCEIVER_TYPE_ETH_DP83XG710Q1_FIX"
    int _XL_TRANSCEIVER_TYPE_ETH_BCM54811S_FIX            "XL_TRANSCEIVER_TYPE_ETH_BCM54811S_FIX"
    int _XL_TRANSCEIVER_TYPE_ETH_RTL9000AA_FIX            "XL_TRANSCEIVER_TYPE_ETH_RTL9000AA_FIX"
    int _XL_TRANSCEIVER_TYPE_ETH_BCM89811_FIX             "XL_TRANSCEIVER_TYPE_ETH_BCM89811_FIX"
    int _XL_TRANSCEIVER_TYPE_ETH_BCM54210_FIX             "XL_TRANSCEIVER_TYPE_ETH_BCM54210_FIX"
    int _XL_TRANSCEIVER_TYPE_ETH_88Q2112_FIX              "XL_TRANSCEIVER_TYPE_ETH_88Q2112_FIX"
    int _XL_TRANSCEIVER_TYPE_ETH_BCM84891_FIX             "XL_TRANSCEIVER_TYPE_ETH_BCM84891_FIX"

    # IOpiggy 8642
    int _XL_TRANSCEIVER_TYPE_PB_DAIO_8642                 "XL_TRANSCEIVER_TYPE_PB_DAIO_8642"
    int _XL_TRANSCEIVER_TYPE_DAIO_AL_ONLY                 "XL_TRANSCEIVER_TYPE_DAIO_AL_ONLY"
    int _XL_TRANSCEIVER_TYPE_DAIO_1021_FIX_WITH_AL        "XL_TRANSCEIVER_TYPE_DAIO_1021_FIX_WITH_AL"
    int _XL_TRANSCEIVER_TYPE_DAIO_AL_WU                   "XL_TRANSCEIVER_TYPE_DAIO_AL_WU"
    int _XL_TRANSCEIVER_TYPE_DAIO_1021_FIX_WITH_5V        "XL_TRANSCEIVER_TYPE_DAIO_1021_FIX_WITH_5V"

    # Eth modules
    int _XL_TRANSCEIVER_TYPE_ETH_MOD_BR_BCM89810          "XL_TRANSCEIVER_TYPE_ETH_MOD_BR_BCM89810"
    int _XL_TRANSCEIVER_TYPE_ETH_MOD_IEEE_RGMII_AR8031    "XL_TRANSCEIVER_TYPE_ETH_MOD_IEEE_RGMII_AR8031"
    int _XL_TRANSCEIVER_TYPE_ETH_MOD_IEEE_SGMII_AR8031    "XL_TRANSCEIVER_TYPE_ETH_MOD_IEEE_SGMII_AR8031"
    int _XL_TRANSCEIVER_TYPE_ETH_MOD_BR_TJA1100           "XL_TRANSCEIVER_TYPE_ETH_MOD_BR_TJA1100"
    int _XL_TRANSCEIVER_TYPE_ETH_MOD_BR_RTL9000AA         "XL_TRANSCEIVER_TYPE_ETH_MOD_BR_RTL9000AA"
    int _XL_TRANSCEIVER_TYPE_ETH_MOD_BR_SGMII_DP83XG710Q1 "XL_TRANSCEIVER_TYPE_ETH_MOD_BR_SGMII_DP83XG710Q1"
    int _XL_TRANSCEIVER_TYPE_ETH_MOD_BR_88Q2112           "XL_TRANSCEIVER_TYPE_ETH_MOD_BR_88Q2112"
    int _XL_TRANSCEIVER_TYPE_ETH_MOD_BR_BCM89811          "XL_TRANSCEIVER_TYPE_ETH_MOD_BR_BCM89811"
    int _XL_TRANSCEIVER_TYPE_ETH_MOD_BR_TJA1101           "XL_TRANSCEIVER_TYPE_ETH_MOD_BR_TJA1101"

    # AE modules
    int _XL_TRANSCEIVER_TYPE_AE_MOD_BR_BCM89883           "XL_TRANSCEIVER_TYPE_AE_MOD_BR_BCM89883"

    # VT Ethernet piggy
    int _XL_TRANSCEIVER_TYPE_PB_ETH_100BASET1_TJA1101     "XL_TRANSCEIVER_TYPE_PB_ETH_100BASET1_TJA1101"
    int _XL_TRANSCEIVER_TYPE_PB_ETH_1000BASET1_88Q2112    "XL_TRANSCEIVER_TYPE_PB_ETH_1000BASET1_88Q2112"

    # defines for xlKlineInit5BdEcu
    int _XL_KLINE_UNCONFIGURE_ECU                         "XL_KLINE_UNCONFIGURE_ECU"
    int _XL_KLINE_CONFIGURE_ECU                           "XL_KLINE_CONFIGURE_ECU"

    # define for addrNot
    int _XL_KLINE_FLAG_TAKE_ADDRNOT                       "XL_KLINE_FLAG_TAKE_ADDRNOT"

    # defines for xlKlineSetUartParams 
    int _XL_KLINE_UART_PARITY_NONE                        "XL_KLINE_UART_PARITY_NONE"
    int _XL_KLINE_UART_PARITY_EVEN                        "XL_KLINE_UART_PARITY_EVEN"
    int _XL_KLINE_UART_PARITY_ODD                         "XL_KLINE_UART_PARITY_ODD"
    int _XL_KLINE_UART_PARITY_MARK                        "XL_KLINE_UART_PARITY_MARK"
    int _XL_KLINE_UART_PARITY_SPACE                       "XL_KLINE_UART_PARITY_SPACE"

    # defines for xlKlineSwitchTesterResistor
    int _XL_KLINE_TESTERRESISTOR_OFF                      "XL_KLINE_TESTERRESISTOR_OFF"
    int _XL_KLINE_TESTERRESISTOR_ON                       "XL_KLINE_TESTERRESISTOR_ON"

    XLstatus xlOpenDriver()
    XLstatus xlCloseDriver()

    XLaccess xlGetChannelMask(int hwType, int hwIndex, int hwChannel)
    int xlGetChannelIndex(int hwType, int hwIndex, int hwChannel)

    XLstatus xlOpenPort(XLportHandle* portHandle, char* userName, XLaccess accessMask, XLaccess* permissionMask, unsigned int rxQueueSize, unsigned int xlInterfaceVersion, unsigned int busType)
    XLstatus xlClosePort(XLportHandle portHandle)
    
    XLstatus xlSetTimerRate(XLportHandle portHandle, unsigned long timerRate)
    XLstatus xlSetTimerRateAndChannel(XLportHandle portHandle, XLaccess* timerChannelMask, unsigned long *timerRate)

    XLstatus xlCanSetChannelBitrate(XLportHandle portHandle, XLaccess accessMask, unsigned long bitrate)
    XLstatus xlCanSetChannelParams(XLportHandle portHandle, XLaccess accessMask, XLchipParams* pChipParams)
    XLstatus xlCanSetChannelParamsC200(XLportHandle portHandle, XLaccess accessMask, unsigned char btr0, unsigned char btr1)

    XLstatus xlActivateChannel(XLportHandle portHandle, XLaccess accessMask, unsigned int busType, unsigned int flags)
    XLstatus xlDeactivateChannel(XLportHandle portHandle, XLaccess accessMask)

    XLstatus xlCanTransmit(XLportHandle portHandle, XLaccess accessMask, unsigned int* messageCount, void* pMessage)
    XLstatus xlCanFlushTransmitQueue(XLportHandle portHandle, XLaccess accessMask)
    XLstatus xlCanRequestChipState(XLportHandle portHandle, XLaccess accessMask)

    XLstatus xlReceive(XLportHandle portHandle, unsigned int* pEventCount, XLevent* pEventList)
    XLstatus xlFlushReceiveQueue(XLportHandle portHandle)
    XLstatus xlGetReceiveQueueLevel(XLportHandle portHandle, int* level)

    XLstatus xlSetNotification(XLportHandle portHandle, XLhandle pXlHandle, int queueLevel)
    
    XLstatus xlResetClock(XLportHandle portHandle)
    
    XLstatus xlCanSetChannelMode(XLportHandle portHandle, XLaccess accessMask, int tx, int txrq)
    XLstatus xlCanSetChannelOutput(XLportHandle portHandle, XLaccess accessMask, unsigned char mode)
    XLstatus xlCanSetReceiveMode(XLportHandle portHandle, unsigned char ErrorFrame, unsigned char ChipState)
    XLstatus xlCanSetChannelTransceiver(XLportHandle portHandle, XLaccess accessMask, int type, int lineMode, int resNet)
    XLstatus xlCanSetChannelAcceptance(XLportHandle portHandle, XLaccess accessMask, unsigned long code, unsigned long mask, unsigned int idRange)
    XLstatus xlCanAddAcceptanceRange(XLportHandle portHandle, XLaccess accessMask, unsigned long first_id, unsigned long last_id)
    XLstatus xlCanRemoveAcceptanceRange(XLportHandle portHandle, XLaccess accessMask, unsigned long first_id, unsigned long last_id)
    XLstatus xlCanResetAcceptance(XLportHandle portHandle, XLaccess accessMask, unsigned int idRange)
    
    XLstatus xlSetGlobalTimeSync(unsigned long newValue, unsigned long* previousValue)
    XLstatus xlGetSyncTime(XLportHandle portHandle, XLuint64* time)
    XLstatus xlGetChannelTime(XLportHandle portHandle, XLaccess accessMask, XLuint64* pChannelTime)
    XLstatus xlGenerateSyncPulse(XLportHandle portHandle, XLaccess accessMask)
    
    XLstringType xlGetEventString(XLevent* ev)
    const char* xlGetErrorString(XLstatus err)

    XLstatus xlGetApplConfig(char *appName, unsigned int appChannel, unsigned int *pHwType, unsigned int *pHwIndex, unsigned int *pHwChannel, unsigned int busType)
    XLstatus xlSetApplConfig(char *appName, unsigned int appChannel, unsigned int hwType, unsigned int hwIndex, unsigned int hwChannel, unsigned int busType)
    
    XLstatus xlGetDriverConfig(XLdriverConfig *pDriverConfig)
    XLstatus xlGetRemoteDriverConfig(XLdriverConfig *pDriverConfig)

    XLstatus xlPopupHwConfig(char* callSign, unsigned int waitForFinish)
    XLstatus xlGetLicenseInfo(XLaccess channelMask, XLlicenseInfo* pLicInfoArray, unsigned int licInfoArraySize)
    XLstatus xlGetKeymanBoxes(unsigned int* boxCount)
    XLstatus xlGetKeymanInfo(unsigned int boxIndex, unsigned int* boxMask, unsigned int* boxSerial, XLuint64* licInfo)


    XLstatus xlCanFdSetConfiguration(XLportHandle portHandle, XLaccess accessMask, XLcanFdConf* pCanFdConf)
    XLstatus xlCanTransmitEx(XLportHandle portHandle, XLaccess accessMask, unsigned int msgCnt, unsigned int* pMsgCntSent, XLcanTxEvent* pXlCanTxEvt)

    XLstatus xlKlineFastInitTester(XLportHandle portHandle, XLaccess accessMask, unsigned int length, unsigned char *data, XLklineInitTester *pxlKlineInitTester)
    XLstatus xlKlineInit5BdEcu(XLportHandle portHandle, XLaccess accessMask, XLkline5BdEcu *pxlKline5BdEcu)
    XLstatus xlKlineInit5BdTester(XLportHandle portHandle, XLaccess accessMask, XLkline5BdTester *pxlKline5BdTester)
    XLstatus xlKlineSetBaudrate(XLportHandle portHandle, XLaccess accessMask, unsigned int baudrate)
    XLstatus xlKlineSetCommunicationTimingEcu(XLportHandle portHandle, XLaccess accessMask, XLklineSetComEcu *pxlKlineSetComEcu)
    XLstatus xlKlineSetCommunicationTimingTester(XLportHandle portHandle, XLaccess accessMask, XLklineSetComTester *pxlKlineSetComTester)
    XLstatus xlKlineSetUartParams(XLportHandle portHandle, XLaccess accessMask, XLklineUartParameter *pxlKlineUartParams)
    XLstatus xlKlineSwitchHighspeedMode(XLportHandle portHandle, XLaccess accessMask, unsigned int trxMode)
    XLstatus xlKlineSwitchTesterResistor(XLportHandle portHandle, XLaccess accessMask, unsigned int testerR)
    XLstatus xlKlineTransmit(XLportHandle portHandle, XLaccess accessMask, unsigned int length, unsigned char *data)
    
    
cpdef enum e_XLevent_type:
    XL_NO_COMMAND               =  0
    XL_RECEIVE_MSG              =  1
    XL_CHIP_STATE               =  4
    XL_TRANSCEIVER              =  6
    XL_TIMER                    =  8
    XL_TRANSMIT_MSG             = 10
    XL_SYNC_PULSE               = 11
    XL_APPLICATION_NOTIFICATION = 15
    XL_LIN_MSG                  = 20
    XL_LIN_ERRMSG               = 21
    XL_LIN_SYNCERR              = 22
    XL_LIN_NOANS                = 23
    XL_LIN_WAKEUP               = 24
    XL_LIN_SLEEP                = 25
    XL_LIN_CRCINFO              = 26
    XL_RECEIVE_DAIO_DATA        = 32
    XL_RECEIVE_DAIO_PIGGY       = 34

cpdef OpenDriver():
    return xlOpenDriver()

cpdef CloseDriver():
    return xlCloseDriver()

cpdef GetChannelMask(int hwType, int hwIndex, int hwChannel):
    return xlGetChannelMask(hwType, hwIndex, hwChannel)

cpdef GetChannelIndex(int hwType, int hwIndex, int hwChannel):
    return xlGetChannelIndex(hwType, hwIndex, hwChannel)

cpdef OpenPort(list portHandle, char* appName, XLaccess accessMask, list permissionMask, unsigned int rxQueueSize, unsigned int xlInterfaceVersion, unsigned int busType):
    cdef XLstatus status = XL_ERROR
    cdef XLportHandle port_handle = XL_INVALID_PORTHANDLE
    cdef XLaccess permission_mask = permissionMask[0]

    status = xlOpenPort(&port_handle, appName, accessMask, &permission_mask, rxQueueSize, xlInterfaceVersion, busType)
    
    portHandle[0] = port_handle
    permissionMask[0] = permission_mask
    return status

cpdef ClosePort(XLportHandle portHandle):
    return xlClosePort(portHandle)

cpdef SetTimerRate(XLportHandle portHandle, unsigned long timerRate):
    return xlSetTimerRate(portHandle, timerRate)

cpdef SetTimerRateAndChannel(XLportHandle portHandle, list ptimerChannelMask, list ptimerRate):
    cdef XLstatus status = XL_ERROR
    cdef XLaccess timerChannelMask = ptimerChannelMask[0]
    cdef unsigned long timerRate = ptimerRate[0]
    
    status = xlSetTimerRateAndChannel(portHandle, &timerChannelMask, &timerRate)

    return status

cpdef CanSetChannelBitrate(XLportHandle portHandle, XLaccess accessMask, unsigned long bitrate):
    return xlCanSetChannelBitrate(portHandle, accessMask, bitrate)

cpdef CanSetChannelParams(XLportHandle portHandle, XLaccess accessMask, dict pChipParams):
    cdef XLstatus status = XL_ERROR
    cdef XLchipParams chipParams = {0}

    chipParams.bitRate  = pChipParams["bitRate"]
    chipParams.sjw      = pChipParams["sjw"]
    chipParams.tseg1    = pChipParams["tseg1"]
    chipParams.tseg2    = pChipParams["tseg2"]
    chipParams.sam      = pChipParams["sam"]

    status = xlCanSetChannelParams(portHandle, accessMask, &chipParams)
    return status

cpdef ActivateChannel(XLportHandle portHandle, XLaccess accessMask, unsigned int busType, unsigned int flags):
    return xlActivateChannel(portHandle, accessMask, busType, flags)

cpdef DeactivateChannel(XLportHandle portHandle, XLaccess accessMask):
    return xlDeactivateChannel(portHandle, accessMask)

cpdef CanTransmit(XLportHandle portHandle, XLaccess accessMask, list messageCount, list pMessage):
    cdef XLstatus status = XL_ERROR
    cdef unsigned int message_count = 0
    cdef XLevent *pxlEvent = NULL

    message_count = <unsigned int>len(pMessage)
    if message_count > 0:
        pxlEvent = <XLevent *> malloc(sizeof(XLevent) * message_count)
        memset(pxlEvent, 0, sizeof(XLevent) * message_count)
        for i, msg in enumerate(pMessage):
            pxlEvent[i].tag                 = <unsigned char >XL_TRANSMIT_MSG
            pxlEvent[i].tagData.msg.flags   = <unsigned short>msg["flags"]
            pxlEvent[i].tagData.msg.id      = <unsigned long >msg["id"]
            pxlEvent[i].tagData.msg.dlc     = <unsigned short>msg["dlc"]
            for j, b in enumerate(msg["data"]):
                pxlEvent[i].tagData.msg.data[j] = b
        status = xlCanTransmit(portHandle, accessMask, &message_count, pxlEvent)
        free(pxlEvent)
    messageCount[0] = message_count
    return status

cpdef CanFlushTransmitQueue(XLportHandle portHandle, XLaccess accessMask):
    return xlCanFlushTransmitQueue(portHandle, accessMask)

cpdef CanRequestChipState(XLportHandle portHandle, XLaccess accessMask):
    return xlCanRequestChipState(portHandle,accessMask)

cpdef Receive(XLportHandle portHandle, list pEventCount, list pEventList, list pEventString):
    cdef XLstatus status = XL_ERROR
    cdef unsigned int eventCount = 1
    cdef XLevent xlEvent
    cdef XLstringType xlstring
    memset(&xlEvent, 0, sizeof(xlEvent))
    retEvent = {}

    status = xlReceive(portHandle, &eventCount, &xlEvent)
    pEventString[0] = xlGetEventString(&xlEvent)

    retEvent["tag"]         = xlEvent.tag
    retEvent["chanIndex"]   = xlEvent.chanIndex
    retEvent["transId"]     = xlEvent.transId
    retEvent["portHandle"]  = xlEvent.portHandle
    retEvent["flags"]       = xlEvent.flags
    retEvent["reserved"]    = xlEvent.reserved
    retEvent["timeStamp"]   = xlEvent.timeStamp # Actual time stamp generated by the hardware with 8 �s resolution. Value is in nanoseconds.

    tagData = {}
    if xlEvent.tag == XL_RECEIVE_MSG:
        msg = {}
        msg["id"]    = xlEvent.tagData.msg.id
        msg["flags"] = xlEvent.tagData.msg.flags
        msg["dlc"]   = xlEvent.tagData.msg.dlc
        msg["data"]   = [xlEvent.tagData.msg.data[i] for i in range(8)]
        tagData["msg"] = msg
    else:
        # The following events are not supported now.
        # Common and CAN events : XL_CHIP_STATE, XL_TRANSCEIVER, XL_TIMER, XL_TRANSMIT_MSG, XL_SYNC_PULSE
        # Special LIN events    : XL_LIN_MSG, XL_LIN_ERRMSG,XL_LIN_SYNCERR, XL_LIN_NOANS, XL_LIN_WAKEUP, XL_LIN_SLEEP, XL_LIN_CRCINFO
        # Special DAIO events   : XL_RECEIVE_DAIO_DATA
        pass
    retEvent["tagData"] = tagData
    pEventCount[0] = eventCount
    pEventList[0] = retEvent
    return status

cpdef FlushReceiveQueue(XLportHandle portHandle):
    return xlFlushReceiveQueue(portHandle)

cpdef GetReceiveQueueLevel(XLportHandle portHandle, list plevel):
    cdef XLstatus status
    cdef int level = plevel[0]
    status = xlGetReceiveQueueLevel(portHandle, &level)
    plevel[0] = level
    return status

cpdef SetNotification(XLportHandle portHandle, list pXlHandle, int queueLevel):
    cpdef XLstatus status = XL_ERROR
    cpdef XLhandle xlHandle = NULL
    status = xlSetNotification(portHandle, &xlHandle, queueLevel)
    pXlHandle[0] = <size_t>xlHandle
    return status

cpdef ResetClock(XLportHandle portHandle):
    return xlResetClock(portHandle)

cpdef CanSetChannelMode(XLportHandle portHandle, XLaccess accessMask, int tx, int txrq):
    return xlCanSetChannelMode(portHandle, accessMask, tx, txrq)

cpdef CanSetChannelOutput(XLportHandle portHandle, XLaccess accessMask, unsigned char mode):
    return xlCanSetChannelOutput(portHandle, accessMask, mode)

cpdef CanSetReceiveMode(XLportHandle portHandle, unsigned char ErrorFrame, unsigned char ChipState):
    return xlCanSetReceiveMode(portHandle, ErrorFrame, ChipState)

cpdef CanSetChannelParamsC200(XLportHandle portHandle, XLaccess accessMask, unsigned char btr0, unsigned char btr1):
    return xlCanSetChannelParamsC200(portHandle, accessMask, btr0, btr1)

cpdef CanSetChannelTransceiver(XLportHandle portHandle, XLaccess accessMask, int type, int lineMode, int resNet):
    return xlCanSetChannelTransceiver(portHandle, accessMask, type, lineMode, resNet)

cpdef CanSetChannelAcceptance(XLportHandle portHandle, XLaccess accessMask, unsigned long code, unsigned long mask, unsigned int idRange):
    return xlCanSetChannelAcceptance(portHandle, accessMask, code, mask, idRange)

cpdef CanAddAcceptanceRange(XLportHandle portHandle, XLaccess accessMask, unsigned long first_id, unsigned long last_id):
    return xlCanAddAcceptanceRange(portHandle, accessMask, first_id, last_id)

cpdef CanRemoveAcceptanceRange(XLportHandle portHandle, XLaccess accessMask, unsigned long first_id, unsigned long last_id):
    return xlCanRemoveAcceptanceRange(portHandle, accessMask, first_id, last_id)

cpdef CanResetAcceptance(XLportHandle portHandle, XLaccess accessMask, unsigned int idRange):
    return xlCanResetAcceptance(portHandle, accessMask, idRange)

cpdef SetGlobalTimeSync(unsigned long newValue, list pPreviousValue):
    cdef XLstatus status = XL_ERROR
    cdef unsigned long previousValue = XL_SET_TIMESYNC_NO_CHANGE
    status = xlSetGlobalTimeSync(newValue, &previousValue)
    pPreviousValue[0] = previousValue
    return status

cpdef GetSyncTime(XLportHandle portHandle, list pTime):
    cdef XLstatus = XL_ERROR
    cdef XLuint64 time = 0
    status = xlGetSyncTime(portHandle, &time)
    pTime[0] = time
    return status

cpdef GetChannelTime(XLportHandle portHandle, XLaccess accessMask, list pChannelTime):
    cpdef XLstatus status = XL_ERROR
    cpdef XLuint64 channelTime
    status = xlGetChannelTime(portHandle, accessMask, &channelTime)
    pChannelTime[0] = channelTime
    return status

cpdef GenerateSyncPulse(XLportHandle portHandle, XLaccess accessMask):
    return xlGenerateSyncPulse(portHandle, accessMask)

#cpdef GetEventString(dict pXLevent):
    #cdef XLevent xlEvent
    #memset(&xlEvent, 0, sizeof(xlEvent))

    # xlEvent.tag         = pXLevent["tag"]
    # xlEvent.chanIndex   = pXLevent["chanIndex"]
    # xlEvent.transId     = pXLevent["transId"]
    # xlEvent.portHandle  = pXLevent["portHandle"]
    # xlEvent.flags       = pXLevent["flags"]
    # xlEvent.timeStamp   = pXLevent["timeStamp"]
    # xlEvent.tagData.msg.id = pXLevent["tagData"]["msg"]["id"]
    # xlEvent.tagData.msg.flags = pXLevent["tagData"]["msg"]["flags"]
    # xlEvent.tagData.msg.dlc = pXLevent["tagData"]["msg"]["dlc"]
    # for i in range(xlEvent.tagData.msg.dlc):
    #     xlEvent.tagData.msg.data[i] = pXLevent["tagData"]["msg"]["data"][i]
    #return xlGetEventString(&xlEvent)

cpdef GetErrorString(XLstatus err):
    return xlGetErrorString(err)

def GetApplConfig(char *appName, unsigned int appChannel, list pHwType, list pHwIndex, list pHwChannel, unsigned int busType):
    cdef XLstatus status = XL_ERROR
    cdef unsigned int hwType    = pHwType[0]
    cdef unsigned int hwIndex   = pHwIndex[0]
    cdef unsigned int hwChannel = pHwChannel[0]

    status = xlGetApplConfig(appName, appChannel, &hwType, &hwIndex, &hwChannel, busType)
    pHwType[0]    = hwType
    pHwIndex[0]   = hwIndex
    pHwChannel[0] = hwChannel

    return status

def SetApplConfig(char *appName, unsigned int appChannel, list pHwType, list pHwIndex, list pHwChannel, unsigned int busType):
    return xlSetApplConfig(appName, appChannel, pHwType[0], pHwIndex[0], pHwChannel[0], busType)

def GetDriverConfig(dict pDriverConfig):
    cdef XLstatus status
    cdef XLdriverConfig driverConfig
    
    status = xlGetDriverConfig(&driverConfig)

    pDriverConfig["dllVersion"]   = driverConfig.dllVersion
    pDriverConfig["channelCount"] = driverConfig.channelCount
    pDriverConfig["reserved[10]"] = [driverConfig.reserved[i] for i in range(10)]

    channel = []
    cdef int channelCount = driverConfig.channelCount
    for i in range(channelCount):
        ch = {}
        ch["name"]                   = bytes(driverConfig.channel[i].name)
        ch["hwType"]                 = driverConfig.channel[i].hwType
        ch["hwIndex"]                = driverConfig.channel[i].hwIndex
        ch["hwChannel"]              = driverConfig.channel[i].hwChannel
        ch["transceiverType"]        = driverConfig.channel[i].transceiverType
        ch["transceiverState"]       = driverConfig.channel[i].transceiverState
        ch["configError"]            = driverConfig.channel[i].configError
        ch["channelIndex"]           = driverConfig.channel[i].channelIndex
        ch["channelMask"]            = driverConfig.channel[i].channelMask
        ch["channelCapabilities"]    = driverConfig.channel[i].channelCapabilities
        ch["channelBusCapabilities"] = driverConfig.channel[i].channelBusCapabilities
        ch["isOnBus"]                = driverConfig.channel[i].isOnBus
        ch["connectedBusType"]       = driverConfig.channel[i].connectedBusType

        busParams = {}
        busParams["busType"] = driverConfig.channel[i].busParams.busType

        data = {}
        if busParams["busType"]   == XL_BUS_TYPE_NONE:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_CAN:
            if driverConfig.channel[i].busParams.data.can.canOpMode == XL_BUS_PARAMS_CANOPMODE_CANFD:
                canFD = {}
                canFD["arbitrationBitRate"] = driverConfig.channel[i].busParams.data.canFD.arbitrationBitRate
                canFD["sjwAbr"]             = driverConfig.channel[i].busParams.data.canFD.sjwAbr
                canFD["tseg1Abr"]           = driverConfig.channel[i].busParams.data.canFD.tseg1Abr
                canFD["tseg2Abr"]           = driverConfig.channel[i].busParams.data.canFD.tseg2Abr
                canFD["samAbr"]             = driverConfig.channel[i].busParams.data.canFD.samAbr
                canFD["outputMode"]         = driverConfig.channel[i].busParams.data.canFD.outputMode
                canFD["sjwDbr"]             = driverConfig.channel[i].busParams.data.canFD.sjwDbr
                canFD["tseg1Dbr"]           = driverConfig.channel[i].busParams.data.canFD.tseg1Dbr
                canFD["tseg2Dbr"]           = driverConfig.channel[i].busParams.data.canFD.tseg2Dbr
                canFD["dataBitRate"]        = driverConfig.channel[i].busParams.data.canFD.dataBitRate
                canFD["canOpMode"]          = driverConfig.channel[i].busParams.data.canFD.canOpMode
                data["canFD"] = canFD
            else:
                can = {}
                can["bitRate"]      = driverConfig.channel[i].busParams.data.can.bitRate
                can["sjw"]          = driverConfig.channel[i].busParams.data.can.sjw
                can["tseg1"]        = driverConfig.channel[i].busParams.data.can.tseg1
                can["tseg2"]        = driverConfig.channel[i].busParams.data.can.tseg2
                can["sam"]          = driverConfig.channel[i].busParams.data.can.sam
                can["outputMode"]   = driverConfig.channel[i].busParams.data.can.outputMode
                can["reserved1[7]"] = bytearray([driverConfig.channel[i].busParams.data.can.reserved1[j] for j in range(7)])
                can["canOpMode"]    = driverConfig.channel[i].busParams.data.can.canOpMode
                data["can"] = can
        elif busParams["busType"] == XL_BUS_TYPE_LIN:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_FLEXRAY:
            flexray = {}
            flexray["status"]   = driverConfig.channel[i].busParams.data.flexray.status
            flexray["cfgMode"]  = driverConfig.channel[i].busParams.data.flexray.cfgMode
            flexray["baudrate"] = driverConfig.channel[i].busParams.data.flexray.baudrate
            data["flexray"] = flexray
        elif busParams["busType"] == XL_BUS_TYPE_AFDX:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_MOST:
            most = {}
            most["activeSpeedGrade"]     = driverConfig.channel[i].busParams.data.most.activeSpeedGrade
            most["compatibleSpeedGrade"] = driverConfig.channel[i].busParams.data.most.compatibleSpeedGrade
            most["inicFwVersion"]        = driverConfig.channel[i].busParams.data.most.inicFwVersion
            data["most"] = most
        elif busParams["busType"] == XL_BUS_TYPE_DAIO:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_J1708:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_KLINE:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_ETHERNET:
            ethernet = {}
            ethernet["macAddr[6]"]      = bytearray([driverConfig.channel[i].busParams.data.ethernet.macAddr[j] for j in range(6)])
            ethernet["connector"]       = driverConfig.channel[i].busParams.data.ethernet.connector
            ethernet["phy"]             = driverConfig.channel[i].busParams.data.ethernet.phy
            ethernet["link"]            = driverConfig.channel[i].busParams.data.ethernet.link
            ethernet["speed"]           = driverConfig.channel[i].busParams.data.ethernet.speed
            ethernet["clockMode"]       = driverConfig.channel[i].busParams.data.ethernet.clockMode
            ethernet["bypass"]          = driverConfig.channel[i].busParams.data.ethernet.bypass
            data["ethernet"] = ethernet
        elif busParams["busType"] == XL_BUS_TYPE_A429:
            a429 = {}
            a429["res1"]             = driverConfig.channel[i].busParams.data.a429.res1
            a429["channelDirection"] = driverConfig.channel[i].busParams.data.a429.channelDirection
            dir = {}
            if a429["channelDirection"] == XL_A429_MSG_CHANNEL_DIR_TX:
                dir["bitrate"]       = driverConfig.channel[i].busParams.data.a429.dir.tx.bitrate
                dir["parity"]        = driverConfig.channel[i].busParams.data.a429.dir.tx.parity
                dir["minGap"]        = driverConfig.channel[i].busParams.data.a429.dir.tx.minGap
            elif driverConfig.channel[i].busParams.data.a429.channelDirection == XL_A429_MSG_CHANNEL_DIR_RX:
                dir["bitrate"]       = driverConfig.channel[i].busParams.data.a429.dir.rx.bitrate
                dir["minBitrate"]    = driverConfig.channel[i].busParams.data.a429.dir.rx.minBitrate
                dir["maxBitrate"]    = driverConfig.channel[i].busParams.data.a429.dir.rx.maxBitrate
                dir["parity"]        = driverConfig.channel[i].busParams.data.a429.dir.rx.parity
                dir["minGap"]        = driverConfig.channel[i].busParams.data.a429.dir.rx.minGap
                dir["autoBaudrate"]  = driverConfig.channel[i].busParams.data.a429.dir.rx.autoBaudrate
            else:
                pass
            dir["raw[24]"]   = bytearray([driverConfig.channel[i].busParams.data.raw[j] for j in range(24)])
            a429["dir"]  = dir
            data["a429"] = a429
        else:
            pass
        
        data["raw[28]"]   = bytearray([driverConfig.channel[i].busParams.data.raw[j] for j in range(28)])
        busParams["data"] = data
        ch["busParams"] = busParams

        ch["_doNotUse"]                     = driverConfig.channel[i]._doNotUse
        ch["driverVersion"]                 = driverConfig.channel[i].driverVersion
        ch["interfaceVersion"]              = driverConfig.channel[i].interfaceVersion
        ch["raw_data[10]"]                  = [driverConfig.channel[i].raw_data[j] for j in range(10)]
        ch["serialNumber"]                  = driverConfig.channel[i].serialNumber
        ch["articleNumber"]                 = driverConfig.channel[i].articleNumber
        ch["transceiverName"]               = bytes(driverConfig.channel[i].transceiverName)
        ch["specialCabFlags"]               = driverConfig.channel[i].specialCabFlags
        ch["dominantTimeout"]               = driverConfig.channel[i].dominantTimeout
        ch["dominantRecessiveDelay"]        = driverConfig.channel[i].dominantRecessiveDelay
        ch["recessiveDominantDelay"]        = driverConfig.channel[i].recessiveDominantDelay
        ch["connectionInfo"]                = driverConfig.channel[i].connectionInfo
        ch["currentlyAvailableTimestamps"]  = driverConfig.channel[i].currentlyAvailableTimestamps
        ch["minimalSupplyVoltage"]          = driverConfig.channel[i].minimalSupplyVoltage
        ch["maximalSupplyVoltage"]          = driverConfig.channel[i].maximalSupplyVoltage
        ch["maximalBaudrate"]               = driverConfig.channel[i].maximalBaudrate
        ch["fpgaCoreCapabilities"]          = driverConfig.channel[i].fpgaCoreCapabilities
        ch["specialDeviceStatus"]           = driverConfig.channel[i].specialDeviceStatus
        ch["channelBusActiveCapabilities"]  = driverConfig.channel[i].channelBusActiveCapabilities
        ch["breakOffset"]                   = driverConfig.channel[i].breakOffset
        ch["delimiterOffset"]               = driverConfig.channel[i].delimiterOffset
        ch["reserved[3]"]                   = bytearray([driverConfig.channel[i].reserved[j] for j in range(3)])

        channel.append(ch)
    
    pDriverConfig["channel"] = channel

    return status


def GetRemoteDriverConfig(dict pDriverConfig):
    cdef XLstatus status
    cdef XLdriverConfig driverConfig
    
    status = xlGetRemoteDriverConfig(&driverConfig)

    pDriverConfig["dllVersion"]   = driverConfig.dllVersion
    pDriverConfig["channelCount"] = driverConfig.channelCount
    pDriverConfig["reserved[10]"] = [driverConfig.reserved[i] for i in range(10)]

    channel = []
    cdef int channelCount = driverConfig.channelCount
    for i in range(channelCount):
        ch = {}
        ch["name"]                   = bytes(driverConfig.channel[i].name)
        ch["hwType"]                 = driverConfig.channel[i].hwType
        ch["hwIndex"]                = driverConfig.channel[i].hwIndex
        ch["hwChannel"]              = driverConfig.channel[i].hwChannel
        ch["transceiverType"]        = driverConfig.channel[i].transceiverType
        ch["transceiverState"]       = driverConfig.channel[i].transceiverState
        ch["configError"]            = driverConfig.channel[i].configError
        ch["channelIndex"]           = driverConfig.channel[i].channelIndex
        ch["channelMask"]            = driverConfig.channel[i].channelMask
        ch["channelCapabilities"]    = driverConfig.channel[i].channelCapabilities
        ch["channelBusCapabilities"] = driverConfig.channel[i].channelBusCapabilities
        ch["isOnBus"]                = driverConfig.channel[i].isOnBus
        ch["connectedBusType"]       = driverConfig.channel[i].connectedBusType

        busParams = {}
        busParams["busType"] = driverConfig.channel[i].busParams.busType

        data = {}
        if busParams["busType"]   == XL_BUS_TYPE_NONE:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_CAN:
            if driverConfig.channel[i].busParams.data.can.canOpMode == XL_BUS_PARAMS_CANOPMODE_CANFD:
                canFD = {}
                canFD["arbitrationBitRate"] = driverConfig.channel[i].busParams.data.canFD.arbitrationBitRate
                canFD["sjwAbr"]             = driverConfig.channel[i].busParams.data.canFD.sjwAbr
                canFD["tseg1Abr"]           = driverConfig.channel[i].busParams.data.canFD.tseg1Abr
                canFD["tseg2Abr"]           = driverConfig.channel[i].busParams.data.canFD.tseg2Abr
                canFD["samAbr"]             = driverConfig.channel[i].busParams.data.canFD.samAbr
                canFD["outputMode"]         = driverConfig.channel[i].busParams.data.canFD.outputMode
                canFD["sjwDbr"]             = driverConfig.channel[i].busParams.data.canFD.sjwDbr
                canFD["tseg1Dbr"]           = driverConfig.channel[i].busParams.data.canFD.tseg1Dbr
                canFD["tseg2Dbr"]           = driverConfig.channel[i].busParams.data.canFD.tseg2Dbr
                canFD["dataBitRate"]        = driverConfig.channel[i].busParams.data.canFD.dataBitRate
                canFD["canOpMode"]          = driverConfig.channel[i].busParams.data.canFD.canOpMode
                data["canFD"] = canFD
            else:
                can = {}
                can["bitRate"]    = driverConfig.channel[i].busParams.data.can.bitRate
                can["sjw"]        = driverConfig.channel[i].busParams.data.can.sjw
                can["tseg1"]      = driverConfig.channel[i].busParams.data.can.tseg1
                can["tseg2"]      = driverConfig.channel[i].busParams.data.can.tseg2
                can["sam"]        = driverConfig.channel[i].busParams.data.can.sam
                can["outputMode"] = driverConfig.channel[i].busParams.data.can.outputMode
                can["reserved1[7]"]= bytearray([driverConfig.channel[i].busParams.data.can.reserved1[j] for j in range(7)])
                can["canOpMode"]  = driverConfig.channel[i].busParams.data.can.canOpMode
                data["can"] = can
        elif busParams["busType"] == XL_BUS_TYPE_LIN:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_FLEXRAY:
            flexray = {}
            flexray["status"]   = driverConfig.channel[i].busParams.data.flexray.status
            flexray["cfgMode"]  = driverConfig.channel[i].busParams.data.flexray.cfgMode
            flexray["baudrate"] = driverConfig.channel[i].busParams.data.flexray.baudrate
            data["flexray"] = flexray
        elif busParams["busType"] == XL_BUS_TYPE_AFDX:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_MOST:
            most = {}
            most["activeSpeedGrade"]     = driverConfig.channel[i].busParams.data.most.activeSpeedGrade
            most["compatibleSpeedGrade"] = driverConfig.channel[i].busParams.data.most.compatibleSpeedGrade
            most["inicFwVersion"]        = driverConfig.channel[i].busParams.data.most.inicFwVersion
            data["most"] = most
        elif busParams["busType"] == XL_BUS_TYPE_DAIO:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_J1708:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_KLINE:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_ETHERNET:
            ethernet = {}
            ethernet["macAddr[6]"]      = bytearray([driverConfig.channel[i].busParams.data.ethernet.macAddr[j] for j in range(6)])
            ethernet["connector"]       = driverConfig.channel[i].busParams.data.ethernet.connector
            ethernet["phy"]             = driverConfig.channel[i].busParams.data.ethernet.phy
            ethernet["link"]            = driverConfig.channel[i].busParams.data.ethernet.link
            ethernet["speed"]           = driverConfig.channel[i].busParams.data.ethernet.speed
            ethernet["clockMode"]       = driverConfig.channel[i].busParams.data.ethernet.clockMode
            ethernet["bypass"]          = driverConfig.channel[i].busParams.data.ethernet.bypass
            data["ethernet"] = ethernet
        elif busParams["busType"] == XL_BUS_TYPE_A429:
            a429 = {}
            a429["res1"] = driverConfig.channel[i].busParams.data.a429.res1
            a429["channelDirection"] = driverConfig.channel[i].busParams.data.a429.channelDirection
            dir = {}
            if a429["channelDirection"] == XL_A429_MSG_CHANNEL_DIR_TX:
                dir["bitrate"] = driverConfig.channel[i].busParams.data.a429.dir.tx.bitrate
                dir["parity"]  = driverConfig.channel[i].busParams.data.a429.dir.tx.parity
                dir["minGap"]  = driverConfig.channel[i].busParams.data.a429.dir.tx.minGap
            elif driverConfig.channel[i].busParams.data.a429.channelDirection == XL_A429_MSG_CHANNEL_DIR_RX:
                dir["bitrate"]     = driverConfig.channel[i].busParams.data.a429.dir.rx.bitrate
                dir["minBitrate"]  = driverConfig.channel[i].busParams.data.a429.dir.rx.minBitrate
                dir["maxBitrate"]  = driverConfig.channel[i].busParams.data.a429.dir.rx.maxBitrate
                dir["parity"]      = driverConfig.channel[i].busParams.data.a429.dir.rx.parity
                dir["minGap"]      = driverConfig.channel[i].busParams.data.a429.dir.rx.minGap
                dir["autoBaudrate"]= driverConfig.channel[i].busParams.data.a429.dir.rx.autoBaudrate
            else:
                pass
            dir["raw[24]"]   = bytearray([driverConfig.channel[i].busParams.data.raw[j] for j in range(24)])
            a429["dir"]  = dir
            data["a429"] = a429
        else:
            pass
        
        data["raw[28]"]   = bytearray([driverConfig.channel[i].busParams.data.raw[j] for j in range(28)])
        busParams["data"] = data
        ch["busParams"] = busParams

        ch["_doNotUse"]                     = driverConfig.channel[i]._doNotUse
        ch["driverVersion"]                 = driverConfig.channel[i].driverVersion
        ch["interfaceVersion"]              = driverConfig.channel[i].interfaceVersion
        ch["raw_data[10]"]                  = [driverConfig.channel[i].raw_data[j] for j in range(10)]
        ch["serialNumber"]                  = driverConfig.channel[i].serialNumber
        ch["articleNumber"]                 = driverConfig.channel[i].articleNumber
        ch["transceiverName"]               = bytes(driverConfig.channel[i].transceiverName)
        ch["specialCabFlags"]               = driverConfig.channel[i].specialCabFlags
        ch["dominantTimeout"]               = driverConfig.channel[i].dominantTimeout
        ch["dominantRecessiveDelay"]        = driverConfig.channel[i].dominantRecessiveDelay
        ch["recessiveDominantDelay"]        = driverConfig.channel[i].recessiveDominantDelay
        ch["connectionInfo"]                = driverConfig.channel[i].connectionInfo
        ch["currentlyAvailableTimestamps"]  = driverConfig.channel[i].currentlyAvailableTimestamps
        ch["minimalSupplyVoltage"]          = driverConfig.channel[i].minimalSupplyVoltage
        ch["maximalSupplyVoltage"]          = driverConfig.channel[i].maximalSupplyVoltage
        ch["maximalBaudrate"]               = driverConfig.channel[i].maximalBaudrate
        ch["fpgaCoreCapabilities"]          = driverConfig.channel[i].fpgaCoreCapabilities
        ch["specialDeviceStatus"]           = driverConfig.channel[i].specialDeviceStatus
        ch["channelBusActiveCapabilities"]  = driverConfig.channel[i].channelBusActiveCapabilities
        ch["breakOffset"]                   = driverConfig.channel[i].breakOffset
        ch["delimiterOffset"]               = driverConfig.channel[i].delimiterOffset
        ch["reserved[3]"]                   = bytearray([driverConfig.channel[i].reserved[j] for j in range(3)])

        channel.append(ch)
    
    pDriverConfig["channel"] = channel

    return status

def PopupHwConfig(char* callSign=NULL, unsigned int waitForFinish=0):
    return xlPopupHwConfig(callSign, waitForFinish)

def GetLicenseInfo(XLaccess channelMask, list pLicInfoArray):
    cdef XLstatus status = XL_ERROR
    cdef XLlicenseInfo licInfoArray[1024]
    cdef unsigned int licInfoArraySize = 1024
    pLicInfoArray = []

    if licInfoArraySize > 0:
        memset(licInfoArray, 0, sizeof(XLlicenseInfo) * licInfoArraySize)
        status = xlGetLicenseInfo(channelMask, licInfoArray, licInfoArraySize)
        if status == XL_SUCCESS:
            for i in range(licInfoArraySize):
                licInfo = {}
                licInfo["bAvailable"] = licInfoArray[i].bAvailable
                licInfo["licName"] =  bytearray([licInfoArray[i].licName[j] for j in range(65)])
                pLicInfoArray.append(licInfo)
    return status

def GetKeymanBoxes(list pBoxCount):
    cdef XLstatus status = XL_ERROR
    cdef unsigned int boxCount = 0
    status = xlGetKeymanBoxes(&boxCount)
    pBoxCount[0] = boxCount
    return status

def GetKeymanInfo(unsigned int boxIndex, list pBoxMask, list pBoxSerial, list pLicInfo):
        cdef XLstatus status = XL_ERROR
        cdef unsigned int boxMask = 0
        cdef unsigned int boxSerial = 0
        cdef XLuint64 licInfo[4]
        pLicInfo = []
        
        memset(licInfo, 0, sizeof(XLuint64) * 4)
        status = xlGetKeymanInfo(boxIndex, &boxMask, &boxSerial, licInfo)
        if status == XL_SUCCESS:
            pBoxMask[0]   = boxMask
            pBoxSerial[0] = boxSerial
            for i in range(4):
                pLicInfo.append(licInfo[i])
        return status

cpdef CanFdSetConfiguration(XLportHandle portHandle, XLaccess accessMask, list pCanFdConf):
    cdef XLstatus status = XL_ERROR
    #cdef XLcanFdConf canFdConf
    #memset(&canFdConf, 0, sizeof(canFdConf))

    #status = xlCanFdSetConfiguration(portHandle, accessMask, &canFdConf)

    #pCanFdConf[0] = canFdConf

    return status

cpdef CanTransmitEx(XLportHandle portHandle, XLaccess accessMask, unsigned char channelIndex, unsigned int msgCnt, list pMsgCntSent, list pXlCanTxEvt):
    cdef XLstatus status = XL_ERROR
    cdef unsigned int message_count = 0
    cdef unsigned int msgCntSent = 0
    cdef XLcanTxEvent* pXLcanTxEvents = NULL

    message_count = <unsigned int>len(pXlCanTxEvt)
    if msgCnt > message_count:
        msgCnt = message_count

    if msgCnt > 0:
        pXLcanTxEvents = <XLcanTxEvent *> malloc(sizeof(XLcanTxEvent) * msgCnt)
        memset(pXLcanTxEvents, 0, sizeof(XLcanTxEvent) * msgCnt)
        for i, msg in enumerate(pXlCanTxEvt):
            pXLcanTxEvents[i].tag                 = <unsigned short>XL_CAN_EV_TAG_TX_MSG
            pXLcanTxEvents[i].transId             = <unsigned short>0xffff
            pXLcanTxEvents[i].channelIndex        = <unsigned char> channelIndex

            pXLcanTxEvents[i].tagData.canMsg.canId      = <unsigned int>msg["canId"]
            pXLcanTxEvents[i].tagData.canMsg.msgFlags   = <unsigned int>msg["msgFlags"]
            pXLcanTxEvents[i].tagData.canMsg.dlc        = <unsigned char>msg["dlc"]
            for j, b in enumerate(msg["data"]):
                pXLcanTxEvents[i].tagData.canMsg.data[j] = b

            status = xlCanTransmitEx(portHandle, accessMask, msgCnt, &msgCntSent, pXLcanTxEvents)
        free(pXLcanTxEvents)

    pMsgCntSent[0] = msgCntSent
    return status

# K-Line
cpdef KlineFastInitTester(XLportHandle portHandle, XLaccess accessMask, unsigned int length, unsigned char* data, dict pXLklineInitTester):
    cdef XLstatus status = XL_ERROR
    cdef XLklineInitTester xlKlineInitTester

    xlKlineInitTester.TiniL    = <unsigned int> pXLklineInitTester["TiniL"]
    xlKlineInitTester.Twup     = <unsigned int> pXLklineInitTester["Twup"]
    
    status = xlKlineFastInitTester(portHandle, accessMask, length, data, &xlKlineInitTester)

    return status    

cpdef KlineInit5BdEcu(XLportHandle portHandle, XLaccess accessMask, dict pXLkline5BdEcu):
    cdef XLstatus status = XL_ERROR
    cdef XLkline5BdEcu xlKline5BdEcu

    xlKline5BdEcu.configure   = <unsigned int> pXLkline5BdEcu["configure"]
    xlKline5BdEcu.addr        = <unsigned int> pXLkline5BdEcu["addr"]
    xlKline5BdEcu.rate5bd     = <unsigned int> pXLkline5BdEcu["rate5bd"]
    xlKline5BdEcu.syncPattern = <unsigned int> pXLkline5BdEcu["syncPattern"]
    xlKline5BdEcu.W1          = <unsigned int> pXLkline5BdEcu["W1"]
    xlKline5BdEcu.W2          = <unsigned int> pXLkline5BdEcu["W2"]
    xlKline5BdEcu.W3          = <unsigned int> pXLkline5BdEcu["W3"]
    xlKline5BdEcu.W4          = <unsigned int> pXLkline5BdEcu["W4"]
    xlKline5BdEcu.W4min       = <unsigned int> pXLkline5BdEcu["W4min"]
    xlKline5BdEcu.W4max       = <unsigned int> pXLkline5BdEcu["W4max"]
    xlKline5BdEcu.kb1         = <unsigned int> pXLkline5BdEcu["kb1"]
    xlKline5BdEcu.kb2         = <unsigned int> pXLkline5BdEcu["kb2"]
    xlKline5BdEcu.addrNot     = <unsigned int> pXLkline5BdEcu["addrNot"]

    status =  xlKlineInit5BdEcu(portHandle, accessMask, &xlKline5BdEcu)

    return status

cpdef KlineInit5BdTester(XLportHandle portHandle, XLaccess accessMask, dict pxlKline5BdTester):
    cdef XLstatus status = XL_ERROR
    cdef XLkline5BdTester xlKline5BdTester

    xlKline5BdTester.addr     = <unsigned int> pxlKline5BdTester["addr"]
    xlKline5BdTester.rate5bd  = <unsigned int> pxlKline5BdTester["rate5bd"]
    xlKline5BdTester.W1min    = <unsigned int> pxlKline5BdTester["W1min"]
    xlKline5BdTester.W1max    = <unsigned int> pxlKline5BdTester["W1max"]
    xlKline5BdTester.W2min    = <unsigned int> pxlKline5BdTester["W2min"]
    xlKline5BdTester.W2max    = <unsigned int> pxlKline5BdTester["W2max"]
    xlKline5BdTester.W3min    = <unsigned int> pxlKline5BdTester["W3min"]
    xlKline5BdTester.W3max    = <unsigned int> pxlKline5BdTester["W3max"]
    xlKline5BdTester.W4       = <unsigned int> pxlKline5BdTester["W4"]
    xlKline5BdTester.W4min    = <unsigned int> pxlKline5BdTester["W4min"]
    xlKline5BdTester.W4max    = <unsigned int> pxlKline5BdTester["W4max"]
    xlKline5BdTester.kb2Not   = <unsigned int> pxlKline5BdTester["kb2Not"]
    
    status =  xlKlineInit5BdTester(portHandle, accessMask, &xlKline5BdTester)

    return status

cpdef KlineSetBaudrate(XLportHandle portHandle, XLaccess accessMask, unsigned int baudrate):
    cdef XLstatus status = XL_ERROR

    status = xlKlineSetBaudrate(portHandle, accessMask, baudrate)

    return status

cpdef KlineSetCommunicationTimingEcu(XLportHandle portHandle, XLaccess accessMask, dict pxlKlineSetComEcu):
    cdef XLstatus status = XL_ERROR
    cdef XLklineSetComEcu xlKlineSetComEcu

    xlKlineSetComEcu.P1       = <unsigned int> pxlKlineSetComEcu["P1"]
    xlKlineSetComEcu.P4min    = <unsigned int> pxlKlineSetComEcu["P4min"]
    xlKlineSetComEcu.TinilMin = <unsigned int> pxlKlineSetComEcu["TinilMin"]
    xlKlineSetComEcu.TinilMax = <unsigned int> pxlKlineSetComEcu["TinilMax"]
    xlKlineSetComEcu.TwupMin  = <unsigned int> pxlKlineSetComEcu["TwupMi"]
    xlKlineSetComEcu.TwupMax  = <unsigned int> pxlKlineSetComEcu["TwupMax"]
    
    status = xlKlineSetCommunicationTimingEcu(portHandle, accessMask, &xlKlineSetComEcu)
    
    return status

cpdef KlineSetCommunicationTimingTester(XLportHandle portHandle, XLaccess accessMask, dict pxlKlineSetComTester):
    cdef XLstatus status = XL_ERROR
    cdef XLklineSetComTester xlKlineSetComTester

    xlKlineSetComTester.P1min    = <unsigned int> pxlKlineSetComTester["P1min"]
    xlKlineSetComTester.P4       = <unsigned int> pxlKlineSetComTester["P4"]
    
    status = xlKlineSetCommunicationTimingTester(portHandle, accessMask, &xlKlineSetComTester)

    return status

cpdef KlineSetUartParams(XLportHandle portHandle, XLaccess accessMask, dict pxlKlineUartParams):
    cdef XLstatus status = XL_ERROR
    cdef XLklineUartParameter xlKlineUartParams

    xlKlineUartParams.databits = <unsigned int> pxlKlineUartParams["databits"]
    xlKlineUartParams.stopbits = <unsigned int> pxlKlineUartParams["stopbits"]
    xlKlineUartParams.parity   = <unsigned int> pxlKlineUartParams["parity"]

    status = xlKlineSetUartParams(portHandle, accessMask, &xlKlineUartParams)

    return status

cpdef KlineSwitchHighspeedMode(XLportHandle portHandle, XLaccess accessMask, unsigned int trxMode):
    cdef XLstatus status = XL_ERROR
    
    status = xlKlineSwitchHighspeedMode(portHandle, accessMask, trxMode)

    return status

cpdef KlineSwitchTesterResistor(XLportHandle portHandle, XLaccess accessMask, unsigned int testerR):
    cdef XLstatus status = XL_ERROR
    
    status = xlKlineSwitchTesterResistor( portHandle, accessMask, testerR)

    return status

cpdef KlineTransmit(XLportHandle portHandle, XLaccess accessMask, unsigned int length, unsigned char* data):
    cdef XLstatus status = XL_ERROR
    
    status = xlKlineTransmit(portHandle, accessMask, length, data)

    return status

# HwType
XL_HWTYPE_NONE                                   = _XL_HWTYPE_NONE
XL_HWTYPE_VIRTUAL                                = _XL_HWTYPE_VIRTUAL
XL_HWTYPE_CANCARDX                               = _XL_HWTYPE_CANCARDX
XL_HWTYPE_CANAC2PCI                              = _XL_HWTYPE_CANAC2PCI
XL_HWTYPE_CANCARDY                               = _XL_HWTYPE_CANCARDY
XL_HWTYPE_CANCARDXL                              = _XL_HWTYPE_CANCARDXL
XL_HWTYPE_CANCASEXL                              = _XL_HWTYPE_CANCASEXL
XL_HWTYPE_CANCASEXL_LOG_OBSOLETE                 = _XL_HWTYPE_CANCASEXL_LOG_OBSOLETE
XL_HWTYPE_CANBOARDXL                             = _XL_HWTYPE_CANBOARDXL
XL_HWTYPE_CANBOARDXL_PXI                         = _XL_HWTYPE_CANBOARDXL_PXI
XL_HWTYPE_VN2600                                 = _XL_HWTYPE_VN2600
XL_HWTYPE_VN2610                                 = _XL_HWTYPE_VN2610
XL_HWTYPE_VN3300                                 = _XL_HWTYPE_VN3300
XL_HWTYPE_VN3600                                 = _XL_HWTYPE_VN3600
XL_HWTYPE_VN7600                                 = _XL_HWTYPE_VN7600
XL_HWTYPE_CANCARDXLE                             = _XL_HWTYPE_CANCARDXLE
XL_HWTYPE_VN8900                                 = _XL_HWTYPE_VN8900
XL_HWTYPE_VN8950                                 = _XL_HWTYPE_VN8950
XL_HWTYPE_VN2640                                 = _XL_HWTYPE_VN2640
XL_HWTYPE_VN1610                                 = _XL_HWTYPE_VN1610
XL_HWTYPE_VN1630                                 = _XL_HWTYPE_VN1630
XL_HWTYPE_VN1640                                 = _XL_HWTYPE_VN1640
XL_HWTYPE_VN8970                                 = _XL_HWTYPE_VN8970
XL_HWTYPE_VN1611                                 = _XL_HWTYPE_VN1611
XL_HWTYPE_VN5240                                 = _XL_HWTYPE_VN5240
XL_HWTYPE_VN5610                                 = _XL_HWTYPE_VN5610
XL_HWTYPE_VN5620                                 = _XL_HWTYPE_VN5620
XL_HWTYPE_VN7570                                 = _XL_HWTYPE_VN7570
XL_HWTYPE_VN5650                                 = _XL_HWTYPE_VN5650
XL_HWTYPE_IPCLIENT                               = _XL_HWTYPE_IPCLIENT
XL_HWTYPE_IPSERVER                               = _XL_HWTYPE_IPSERVER
XL_HWTYPE_VX1121                                 = _XL_HWTYPE_VX1121
XL_HWTYPE_VX1131                                 = _XL_HWTYPE_VX1131
XL_HWTYPE_VT6204                                 = _XL_HWTYPE_VT6204
XL_HWTYPE_VN1630_LOG                             = _XL_HWTYPE_VN1630_LOG
XL_HWTYPE_VN7610                                 = _XL_HWTYPE_VN7610
XL_HWTYPE_VN7572                                 = _XL_HWTYPE_VN7572
XL_HWTYPE_VN8972                                 = _XL_HWTYPE_VN8972
XL_HWTYPE_VN0601                                 = _XL_HWTYPE_VN0601
XL_HWTYPE_VN5640                                 = _XL_HWTYPE_VN5640
XL_HWTYPE_VX0312                                 = _XL_HWTYPE_VX0312
XL_HWTYPE_VH6501                                 = _XL_HWTYPE_VH6501
XL_HWTYPE_VN8800                                 = _XL_HWTYPE_VN8800
XL_HWTYPE_IPCL8800                               = _XL_HWTYPE_IPCL8800
XL_HWTYPE_IPSRV8800                              = _XL_HWTYPE_IPSRV8800
XL_HWTYPE_CSMCAN                                 = _XL_HWTYPE_CSMCAN
XL_HWTYPE_VN5610A                                = _XL_HWTYPE_VN5610A
XL_HWTYPE_VN7640                                 = _XL_HWTYPE_VN7640
XL_HWTYPE_VX1135                                 = _XL_HWTYPE_VX1135
XL_HWTYPE_VN4610                                 = _XL_HWTYPE_VN4610
XL_HWTYPE_VT6306                                 = _XL_HWTYPE_VT6306
XL_HWTYPE_VT6104A                                = _XL_HWTYPE_VT6104A
XL_HWTYPE_VN5430                                 = _XL_HWTYPE_VN5430
XL_HWTYPE_VTSSERVICE                             = _XL_HWTYPE_VTSSERVICE
XL_HWTYPE_VN1530                                 = _XL_HWTYPE_VN1530
XL_HWTYPE_VN1531                                 = _XL_HWTYPE_VN1531
XL_HWTYPE_VX1161A                                = _XL_HWTYPE_VX1161A
XL_HWTYPE_VX1161B                                = _XL_HWTYPE_VX1161B
XL_MAX_HWTYPE                                    = _XL_MAX_HWTYPE

# BusType
XL_BUS_TYPE_NONE                                 = _XL_BUS_TYPE_NONE
XL_BUS_TYPE_CAN                                  = _XL_BUS_TYPE_CAN
XL_BUS_TYPE_LIN                                  = _XL_BUS_TYPE_LIN
XL_BUS_TYPE_FLEXRAY                              = _XL_BUS_TYPE_FLEXRAY
XL_BUS_TYPE_AFDX                                 = _XL_BUS_TYPE_AFDX
XL_BUS_TYPE_MOST                                 = _XL_BUS_TYPE_MOST
XL_BUS_TYPE_DAIO                                 = _XL_BUS_TYPE_DAIO
XL_BUS_TYPE_J1708                                = _XL_BUS_TYPE_J1708
XL_BUS_TYPE_KLINE                                = _XL_BUS_TYPE_KLINE
XL_BUS_TYPE_ETHERNET                             = _XL_BUS_TYPE_ETHERNET
XL_BUS_TYPE_A429                                 = _XL_BUS_TYPE_A429

# interface version for our events
XL_INTERFACE_VERSION_V2                          = _XL_INTERFACE_VERSION_V2
XL_INTERFACE_VERSION_V3                          = _XL_INTERFACE_VERSION_V3
XL_INTERFACE_VERSION_V4                          = _XL_INTERFACE_VERSION_V4 # for MOST,CAN FD, Ethernet, FlexRay, ARINC429

#current version
XL_INTERFACE_VERSION                             = _XL_INTERFACE_VERSION # forCAN, LIN, DAIO.

# porthandle
XL_INVALID_PORTHANDLE                            = _XL_INVALID_PORTHANDLE

# defines for XLbusParams::data::can/canFD::canOpMode
XL_BUS_PARAMS_CANOPMODE_CAN20                    = _XL_BUS_PARAMS_CANOPMODE_CAN20
XL_BUS_PARAMS_CANOPMODE_CANFD                    = _XL_BUS_PARAMS_CANOPMODE_CANFD
XL_BUS_PARAMS_CANOPMODE_CANFD_NO_ISO             = _XL_BUS_PARAMS_CANOPMODE_CANFD_NO_ISO

# ARINC429 types and definitions
# defines for XL_A429_PARAMS::channelDirection
XL_A429_MSG_CHANNEL_DIR_TX                       = _XL_A429_MSG_CHANNEL_DIR_TX
XL_A429_MSG_CHANNEL_DIR_RX                       = _XL_A429_MSG_CHANNEL_DIR_RX

# to be used with XL_A429_PARAMS::data::tx::bitrate
XL_A429_MSG_BITRATE_SLOW_MIN                     = _XL_A429_MSG_BITRATE_SLOW_MIN
XL_A429_MSG_BITRATE_SLOW_MAX                     = _XL_A429_MSG_BITRATE_SLOW_MAX
XL_A429_MSG_BITRATE_FAST_MIN                     = _XL_A429_MSG_BITRATE_FAST_MIN
XL_A429_MSG_BITRATE_FAST_MAX                     = _XL_A429_MSG_BITRATE_FAST_MAX

# to be used with XL_A429_PARAMS::data::tx/rx::minGap
XL_A429_MSG_GAP_4BIT                             = _XL_A429_MSG_GAP_4BIT

# to be used with XL_A429_PARAMS::rx::minBitrate/maxBitrate
XL_A429_MSG_BITRATE_RX_MIN                       = _XL_A429_MSG_BITRATE_RX_MIN
XL_A429_MSG_BITRATE_RX_MAX                       = _XL_A429_MSG_BITRATE_RX_MAX

# to be used with XL_A429_PARAMS::rx::autoBaudrate
XL_A429_MSG_AUTO_BAUDRATE_DISABLED               = _XL_A429_MSG_AUTO_BAUDRATE_DISABLED
XL_A429_MSG_AUTO_BAUDRATE_ENABLED                = _XL_A429_MSG_AUTO_BAUDRATE_ENABLED

# to be used with XL_A429_TX_MSG::flags
XL_A429_MSG_FLAG_ON_REQUEST                      = _XL_A429_MSG_FLAG_ON_REQUEST
XL_A429_MSG_FLAG_CYCLIC                          = _XL_A429_MSG_FLAG_CYCLIC
XL_A429_MSG_FLAG_DELETE_CYCLIC                   = _XL_A429_MSG_FLAG_DELETE_CYCLIC

# to be used with XL_A429_TX_MSG::cycleTime
XL_A429_MSG_CYCLE_MAX                            = _XL_A429_MSG_CYCLE_MAX

# to be used with XL_A429_TX_MSG::gap
XL_A429_MSG_GAP_DEFAULT                          = _XL_A429_MSG_GAP_DEFAULT
XL_A429_MSG_GAP_MAX                              = _XL_A429_MSG_GAP_MAX

# to be used with XL_A429_PARAMS::data::parity
# to be used with XL_A429_TX_MSG::parity
XL_A429_MSG_PARITY_DEFAULT                       = _XL_A429_MSG_PARITY_DEFAULT
XL_A429_MSG_PARITY_DISABLED                      = _XL_A429_MSG_PARITY_DISABLED
XL_A429_MSG_PARITY_ODD                           = _XL_A429_MSG_PARITY_ODD
XL_A429_MSG_PARITY_EVEN                          = _XL_A429_MSG_PARITY_EVEN
XL_A429_EV_TX_MSG_CTRL_ON_REQUEST                = _XL_A429_EV_TX_MSG_CTRL_ON_REQUEST
XL_A429_EV_TX_MSG_CTRL_CYCLIC                    = _XL_A429_EV_TX_MSG_CTRL_CYCLIC
XL_A429_EV_TX_ERROR_ACCESS_DENIED                = _XL_A429_EV_TX_ERROR_ACCESS_DENIED
XL_A429_EV_TX_ERROR_TRANSMISSION_ERROR           = _XL_A429_EV_TX_ERROR_TRANSMISSION_ERROR
XL_A429_EV_RX_ERROR_GAP_VIOLATION                = _XL_A429_EV_RX_ERROR_GAP_VIOLATION
XL_A429_EV_RX_ERROR_PARITY                       = _XL_A429_EV_RX_ERROR_PARITY
XL_A429_EV_RX_ERROR_BITRATE_LOW                  = _XL_A429_EV_RX_ERROR_BITRATE_LOW
XL_A429_EV_RX_ERROR_BITRATE_HIGH                 = _XL_A429_EV_RX_ERROR_BITRATE_HIGH
XL_A429_EV_RX_ERROR_FRAME_FORMAT                 = _XL_A429_EV_RX_ERROR_FRAME_FORMAT
XL_A429_EV_RX_ERROR_CODING_RZ                    = _XL_A429_EV_RX_ERROR_CODING_RZ
XL_A429_EV_RX_ERROR_DUTY_FACTOR                  = _XL_A429_EV_RX_ERROR_DUTY_FACTOR
XL_A429_EV_RX_ERROR_AVG_BIT_LENGTH               = _XL_A429_EV_RX_ERROR_AVG_BIT_LENGTH
XL_A429_QUEUE_OVERFLOW                           = _XL_A429_QUEUE_OVERFLOW
XL_A429_RX_FIFO_QUEUE_SIZE_MAX                   = _XL_A429_RX_FIFO_QUEUE_SIZE_MAX
XL_A429_RX_FIFO_QUEUE_SIZE_MIN                   = _XL_A429_RX_FIFO_QUEUE_SIZE_MIN

# driver status
# Common Error Codes
XL_SUCCESS                                       = _XL_SUCCESS
XL_PENDING                                       = _XL_PENDING
XL_ERR_QUEUE_IS_EMPTY                            = _XL_ERR_QUEUE_IS_EMPTY
XL_ERR_QUEUE_IS_FULL                             = _XL_ERR_QUEUE_IS_FULL
XL_ERR_TX_NOT_POSSIBLE                           = _XL_ERR_TX_NOT_POSSIBLE
XL_ERR_NO_LICENSE                                = _XL_ERR_NO_LICENSE
XL_ERR_WRONG_PARAMETER                           = _XL_ERR_WRONG_PARAMETER
XL_ERR_TWICE_REGISTER                            = _XL_ERR_TWICE_REGISTER
XL_ERR_INVALID_CHAN_INDEX                        = _XL_ERR_INVALID_CHAN_INDEX
XL_ERR_INVALID_ACCESS                            = _XL_ERR_INVALID_ACCESS
XL_ERR_PORT_IS_OFFLINE                           = _XL_ERR_PORT_IS_OFFLINE
XL_ERR_CHAN_IS_ONLINE                            = _XL_ERR_CHAN_IS_ONLINE
XL_ERR_NOT_IMPLEMENTED                           = _XL_ERR_NOT_IMPLEMENTED
XL_ERR_INVALID_PORT                              = _XL_ERR_INVALID_PORT
XL_ERR_HW_NOT_READY                              = _XL_ERR_HW_NOT_READY
XL_ERR_CMD_TIMEOUT                               = _XL_ERR_CMD_TIMEOUT
XL_ERR_CMD_HANDLING                              = _XL_ERR_CMD_HANDLING
XL_ERR_HW_NOT_PRESENT                            = _XL_ERR_HW_NOT_PRESENT
XL_ERR_NOTIFY_ALREADY_ACTIVE                     = _XL_ERR_NOTIFY_ALREADY_ACTIVE
XL_ERR_INVALID_TAG                               = _XL_ERR_INVALID_TAG
XL_ERR_INVALID_RESERVED_FLD                      = _XL_ERR_INVALID_RESERVED_FLD
XL_ERR_INVALID_SIZE                              = _XL_ERR_INVALID_SIZE
XL_ERR_INSUFFICIENT_BUFFER                       = _XL_ERR_INSUFFICIENT_BUFFER
XL_ERR_ERROR_CRC                                 = _XL_ERR_ERROR_CRC
XL_ERR_NOT_FOUND                                 = _XL_ERR_NOT_FOUND
XL_ERR_REQ_NOT_ACCEP                             = _XL_ERR_REQ_NOT_ACCEP
XL_ERR_INVALID_LEVEL                             = _XL_ERR_INVALID_LEVEL
XL_ERR_NO_DATA_DETECTED                          = _XL_ERR_NO_DATA_DETECTED
XL_ERR_INTERNAL_ERROR                            = _XL_ERR_INTERNAL_ERROR
XL_ERR_INVALID_USER_BUFFER                       = _XL_ERR_INVALID_USER_BUFFER
XL_ERR_INVALID_PORT_ACCESS_TYPE                  = _XL_ERR_INVALID_PORT_ACCESS_TYPE
XL_ERR_NO_RESOURCES                              = _XL_ERR_NO_RESOURCES
XL_ERR_WRONG_CHIP_TYPE                           = _XL_ERR_WRONG_CHIP_TYPE
XL_ERR_WRONG_COMMAND                             = _XL_ERR_WRONG_COMMAND
XL_ERR_INVALID_HANDLE                            = _XL_ERR_INVALID_HANDLE
XL_ERR_RESERVED_NOT_ZERO                         = _XL_ERR_RESERVED_NOT_ZERO
XL_ERR_INIT_ACCESS_MISSING                       = _XL_ERR_INIT_ACCESS_MISSING
XL_ERR_WRONG_VERSION                             = _XL_ERR_WRONG_VERSION
XL_ERR_CANNOT_OPEN_DRIVER                        = _XL_ERR_CANNOT_OPEN_DRIVER
XL_ERR_WRONG_BUS_TYPE                            = _XL_ERR_WRONG_BUS_TYPE
XL_ERR_DLL_NOT_FOUND                             = _XL_ERR_DLL_NOT_FOUND
XL_ERR_INVALID_CHANNEL_MASK                      = _XL_ERR_INVALID_CHANNEL_MASK
XL_ERR_NOT_SUPPORTED                             = _XL_ERR_NOT_SUPPORTED
XL_ERR_CONNECTION_BROKEN                         = _XL_ERR_CONNECTION_BROKEN
XL_ERR_CONNECTION_CLOSED                         = _XL_ERR_CONNECTION_CLOSED
XL_ERR_INVALID_STREAM_NAME                       = _XL_ERR_INVALID_STREAM_NAME
XL_ERR_CONNECTION_FAILED                         = _XL_ERR_CONNECTION_FAILED
XL_ERR_STREAM_NOT_FOUND                          = _XL_ERR_STREAM_NOT_FOUND
XL_ERR_STREAM_NOT_CONNECTED                      = _XL_ERR_STREAM_NOT_CONNECTED
XL_ERR_QUEUE_OVERRUN                             = _XL_ERR_QUEUE_OVERRUN
XL_ERROR                                         = _XL_ERROR

# CAN FD Error Codes
XL_ERR_INVALID_DLC                               = _XL_ERR_INVALID_DLC
XL_ERR_INVALID_CANID                             = _XL_ERR_INVALID_CANID
XL_ERR_INVALID_FDFLAG_MODE20                     = _XL_ERR_INVALID_FDFLAG_MODE20
XL_ERR_EDL_RTR                                   = _XL_ERR_EDL_RTR
XL_ERR_EDL_NOT_SET                               = _XL_ERR_EDL_NOT_SET
XL_ERR_UNKNOWN_FLAG                              = _XL_ERR_UNKNOWN_FLAG

# FlexRay Error Codes
XL_ERR_PDU_OUT_OF_MEMORY                         = _XL_ERR_PDU_OUT_OF_MEMORY
XL_ERR_FR_CLUSTERCONFIG_MISSING                  = _XL_ERR_FR_CLUSTERCONFIG_MISSING
XL_ERR_PDU_OFFSET_REPET_INVALID                  = _XL_ERR_PDU_OFFSET_REPET_INVALID
XL_ERR_PDU_PAYLOAD_SIZE_INVALID                  = _XL_ERR_PDU_PAYLOAD_SIZE_INVALID
XL_ERR_FR_NBR_FRAMES_OVERFLOW                    = _XL_ERR_FR_NBR_FRAMES_OVERFLOW
XL_ERR_FR_SLOT_ID_INVALID                        = _XL_ERR_FR_SLOT_ID_INVALID
XL_ERR_FR_SLOT_ALREADY_OCCUPIED_BY_ERAY          = _XL_ERR_FR_SLOT_ALREADY_OCCUPIED_BY_ERAY
XL_ERR_FR_SLOT_OCCUPIED_BY_OTHER_APP             = _XL_ERR_FR_SLOT_OCCUPIED_BY_OTHER_APP
XL_ERR_FR_SLOT_IN_WRONG_SEGMENT                  = _XL_ERR_FR_SLOT_IN_WRONG_SEGMENT
XL_ERR_FR_FRAME_CYCLE_MULTIPLEX_ERROR            = _XL_ERR_FR_FRAME_CYCLE_MULTIPLEX_ERROR
XL_ERR_PDU_NO_UNMAP_OF_SYNCFRAME                 = _XL_ERR_PDU_NO_UNMAP_OF_SYNCFRAME
XL_ERR_SYNC_FRAME_MODE                           = _XL_ERR_SYNC_FRAME_MODE

# Ethernet Error Codes
XL_ERR_ETH_PHY_ACTIVATION_FAILED                 = _XL_ERR_ETH_PHY_ACTIVATION_FAILED
XL_ERR_ETH_PHY_CONFIG_ABORTED                    = _XL_ERR_ETH_PHY_CONFIG_ABORTED
XL_ERR_ETH_RESET_FAILED                          = _XL_ERR_ETH_RESET_FAILED
XL_ERR_ETH_SET_CONFIG_DELAYED                    = _XL_ERR_ETH_SET_CONFIG_DELAYED
XL_ERR_ETH_UNSUPPORTED_FEATURE                   = _XL_ERR_ETH_UNSUPPORTED_FEATURE
XL_ERR_ETH_MAC_ACTIVATION_FAILED                 = _XL_ERR_ETH_MAC_ACTIVATION_FAILED
XL_ERR_NET_ETH_SWITCH_IS_ONLINE                  = _XL_ERR_NET_ETH_SWITCH_IS_ONLINE




# activate - channel flags
XL_ACTIVATE_NONE                                 = _XL_ACTIVATE_NONE
XL_ACTIVATE_RESET_CLOCK                          = _XL_ACTIVATE_RESET_CLOCK

XL_CAN_EXT_MSG_ID                                = _XL_CAN_EXT_MSG_ID
XL_CAN_MSG_FLAG_ERROR_FRAME                      = _XL_CAN_MSG_FLAG_ERROR_FRAME
XL_CAN_MSG_FLAG_OVERRUN                          = _XL_CAN_MSG_FLAG_OVERRUN
XL_CAN_MSG_FLAG_NERR                             = _XL_CAN_MSG_FLAG_NERR
XL_CAN_MSG_FLAG_WAKEUP                           = _XL_CAN_MSG_FLAG_WAKEUP
XL_CAN_MSG_FLAG_REMOTE_FRAME                     = _XL_CAN_MSG_FLAG_REMOTE_FRAME
XL_CAN_MSG_FLAG_RESERVED_1                       = _XL_CAN_MSG_FLAG_RESERVED_1
XL_CAN_MSG_FLAG_TX_COMPLETED                     = _XL_CAN_MSG_FLAG_TX_COMPLETED
XL_CAN_MSG_FLAG_TX_REQUEST                       = _XL_CAN_MSG_FLAG_TX_REQUEST
XL_CAN_MSG_FLAG_SRR_BIT_DOM                      = _XL_CAN_MSG_FLAG_SRR_BIT_DOM
XL_EVENT_FLAG_OVERRUN                            = _XL_EVENT_FLAG_OVERRUN
XL_LIN_MSGFLAG_TX                                = _XL_LIN_MSGFLAG_TX
XL_LIN_MSGFLAG_CRCERROR                          = _XL_LIN_MSGFLAG_CRCERROR

XL_SET_TIMESYNC_NO_CHANGE                        = _XL_SET_TIMESYNC_NO_CHANGE
XL_SET_TIMESYNC_ON                               = _XL_SET_TIMESYNC_ON
XL_SET_TIMESYNC_OFF                              = _XL_SET_TIMESYNC_OFF

XL_CAN_TXMSG_FLAG_EDL                            = _XL_CAN_TXMSG_FLAG_EDL
XL_CAN_TXMSG_FLAG_BRS                            = _XL_CAN_TXMSG_FLAG_BRS
XL_CAN_TXMSG_FLAG_RTR                            = _XL_CAN_TXMSG_FLAG_RTR
XL_CAN_TXMSG_FLAG_HIGHPRIO                       = _XL_CAN_TXMSG_FLAG_HIGHPRIO
XL_CAN_TXMSG_FLAG_WAKEUP                         = _XL_CAN_TXMSG_FLAG_WAKEUP
XL_CAN_EV_TAG_TX_MSG                             = _XL_CAN_EV_TAG_TX_MSG


XL_BUS_COMPATIBLE_CAN                            = _XL_BUS_COMPATIBLE_CAN
XL_BUS_COMPATIBLE_LIN                            = _XL_BUS_COMPATIBLE_LIN
XL_BUS_COMPATIBLE_FLEXRAY                        = _XL_BUS_COMPATIBLE_FLEXRAY
XL_BUS_COMPATIBLE_MOST                           = _XL_BUS_COMPATIBLE_MOST
XL_BUS_COMPATIBLE_DAIO                           = _XL_BUS_COMPATIBLE_DAIO
XL_BUS_COMPATIBLE_J1708                          = _XL_BUS_COMPATIBLE_J1708
XL_BUS_COMPATIBLE_KLINE                          = _XL_BUS_COMPATIBLE_KLINE
XL_BUS_COMPATIBLE_ETHERNET                       = _XL_BUS_COMPATIBLE_ETHERNET
XL_BUS_COMPATIBLE_A429                           = _XL_BUS_COMPATIBLE_A429

# the following bus types can be used with the current cab / piggy  
XL_BUS_ACTIVE_CAP_CAN                            = _XL_BUS_ACTIVE_CAP_CAN
XL_BUS_ACTIVE_CAP_LIN                            = _XL_BUS_ACTIVE_CAP_LIN
XL_BUS_ACTIVE_CAP_FLEXRAY                        = _XL_BUS_ACTIVE_CAP_FLEXRAY
XL_BUS_ACTIVE_CAP_MOST                           = _XL_BUS_ACTIVE_CAP_MOST
XL_BUS_ACTIVE_CAP_DAIO                           = _XL_BUS_ACTIVE_CAP_DAIO
XL_BUS_ACTIVE_CAP_J1708                          = _XL_BUS_ACTIVE_CAP_J1708
XL_BUS_ACTIVE_CAP_KLINE                          = _XL_BUS_ACTIVE_CAP_KLINE
XL_BUS_ACTIVE_CAP_ETHERNET                       = _XL_BUS_ACTIVE_CAP_ETHERNET
XL_BUS_ACTIVE_CAP_A429                           = _XL_BUS_ACTIVE_CAP_A429

# T_XL_ETH_CHANNEL_STATUS.activeConnector
XL_ETH_STATUS_CONNECTOR_DEFAULT                  = _XL_ETH_STATUS_CONNECTOR_DEFAULT
XL_ETH_STATUS_CONNECTOR_RJ45                     = _XL_ETH_STATUS_CONNECTOR_RJ45
XL_ETH_STATUS_CONNECTOR_DSUB                     = _XL_ETH_STATUS_CONNECTOR_DSUB

# T_XL_ETH_CHANNEL_STATUS.activePhy
XL_ETH_STATUS_PHY_UNKNOWN                        = _XL_ETH_STATUS_PHY_UNKNOWN
XL_ETH_STATUS_PHY_IEEE_802_3                     = _XL_ETH_STATUS_PHY_IEEE_802_3
XL_ETH_STATUS_PHY_BROADR_REACH                   = _XL_ETH_STATUS_PHY_BROADR_REACH
XL_ETH_STATUS_PHY_100BASE_T1                     = _XL_ETH_STATUS_PHY_100BASE_T1
XL_ETH_STATUS_PHY_1000BASE_T1                    = _XL_ETH_STATUS_PHY_1000BASE_T1

# T_XL_ETH_CHANNEL_STATUS.link
XL_ETH_STATUS_LINK_UNKNOWN                       = _XL_ETH_STATUS_LINK_UNKNOWN
XL_ETH_STATUS_LINK_DOWN                          = _XL_ETH_STATUS_LINK_DOWN
XL_ETH_STATUS_LINK_UP                            = _XL_ETH_STATUS_LINK_UP
XL_ETH_STATUS_LINK_ERROR                         = _XL_ETH_STATUS_LINK_ERROR

# T_XL_ETH_CHANNEL_STATUS.speed
XL_ETH_STATUS_SPEED_UNKNOWN                      = _XL_ETH_STATUS_SPEED_UNKNOWN
XL_ETH_STATUS_SPEED_10                           = _XL_ETH_STATUS_SPEED_10
XL_ETH_STATUS_SPEED_100                          = _XL_ETH_STATUS_SPEED_100
XL_ETH_STATUS_SPEED_1000                         = _XL_ETH_STATUS_SPEED_1000
XL_ETH_STATUS_SPEED_2500                         = _XL_ETH_STATUS_SPEED_2500
XL_ETH_STATUS_SPEED_5000                         = _XL_ETH_STATUS_SPEED_5000
XL_ETH_STATUS_SPEED_10000                        = _XL_ETH_STATUS_SPEED_10000

# T_XL_ETH_CHANNEL_STATUS.clockMode
XL_ETH_STATUS_CLOCK_DONT_CARE                    = _XL_ETH_STATUS_CLOCK_DONT_CARE
XL_ETH_STATUS_CLOCK_MASTER                       = _XL_ETH_STATUS_CLOCK_MASTER
XL_ETH_STATUS_CLOCK_SLAVE                        = _XL_ETH_STATUS_CLOCK_SLAVE

# Bypass values
XL_ETH_BYPASS_INACTIVE                           = _XL_ETH_BYPASS_INACTIVE
XL_ETH_BYPASS_PHY                                = _XL_ETH_BYPASS_PHY
XL_ETH_BYPASS_MACCORE                            = _XL_ETH_BYPASS_MACCORE


# Transceiver types
# CAN Cab
XL_TRANSCEIVER_TYPE_NONE                         = _XL_TRANSCEIVER_TYPE_NONE
XL_TRANSCEIVER_TYPE_CAN_251                      = _XL_TRANSCEIVER_TYPE_CAN_251
XL_TRANSCEIVER_TYPE_CAN_252                      = _XL_TRANSCEIVER_TYPE_CAN_252
XL_TRANSCEIVER_TYPE_CAN_DNOPTO                   = _XL_TRANSCEIVER_TYPE_CAN_DNOPTO
XL_TRANSCEIVER_TYPE_CAN_SWC_PROTO                = _XL_TRANSCEIVER_TYPE_CAN_SWC_PROTO
XL_TRANSCEIVER_TYPE_CAN_SWC                      = _XL_TRANSCEIVER_TYPE_CAN_SWC
XL_TRANSCEIVER_TYPE_CAN_EVA                      = _XL_TRANSCEIVER_TYPE_CAN_EVA
XL_TRANSCEIVER_TYPE_CAN_FIBER                    = _XL_TRANSCEIVER_TYPE_CAN_FIBER
XL_TRANSCEIVER_TYPE_CAN_1054_OPTO                = _XL_TRANSCEIVER_TYPE_CAN_1054_OPTO
XL_TRANSCEIVER_TYPE_CAN_SWC_OPTO                 = _XL_TRANSCEIVER_TYPE_CAN_SWC_OPTO
XL_TRANSCEIVER_TYPE_CAN_B10011S                  = _XL_TRANSCEIVER_TYPE_CAN_B10011S
XL_TRANSCEIVER_TYPE_CAN_1050                     = _XL_TRANSCEIVER_TYPE_CAN_1050
XL_TRANSCEIVER_TYPE_CAN_1050_OPTO                = _XL_TRANSCEIVER_TYPE_CAN_1050_OPTO
XL_TRANSCEIVER_TYPE_CAN_1041                     = _XL_TRANSCEIVER_TYPE_CAN_1041
XL_TRANSCEIVER_TYPE_CAN_1041_OPTO                = _XL_TRANSCEIVER_TYPE_CAN_1041_OPTO
XL_TRANSCEIVER_TYPE_CAN_VIRTUAL                  = _XL_TRANSCEIVER_TYPE_CAN_VIRTUAL
XL_TRANSCEIVER_TYPE_LIN_6258_OPTO                = _XL_TRANSCEIVER_TYPE_LIN_6258_OPTO
XL_TRANSCEIVER_TYPE_LIN_6259_OPTO                = _XL_TRANSCEIVER_TYPE_LIN_6259_OPTO
XL_TRANSCEIVER_TYPE_DAIO_8444_OPTO               = _XL_TRANSCEIVER_TYPE_DAIO_8444_OPTO
XL_TRANSCEIVER_TYPE_CAN_1041A_OPTO               = _XL_TRANSCEIVER_TYPE_CAN_1041A_OPTO
XL_TRANSCEIVER_TYPE_LIN_6259_MAG                 = _XL_TRANSCEIVER_TYPE_LIN_6259_MAG
XL_TRANSCEIVER_TYPE_LIN_7259_MAG                 = _XL_TRANSCEIVER_TYPE_LIN_7259_MAG
XL_TRANSCEIVER_TYPE_LIN_7269_MAG                 = _XL_TRANSCEIVER_TYPE_LIN_7269_MAG
XL_TRANSCEIVER_TYPE_CAN_1054_MAG                 = _XL_TRANSCEIVER_TYPE_CAN_1054_MAG
XL_TRANSCEIVER_TYPE_CAN_251_MAG                  = _XL_TRANSCEIVER_TYPE_CAN_251_MAG
XL_TRANSCEIVER_TYPE_CAN_1050_MAG                 = _XL_TRANSCEIVER_TYPE_CAN_1050_MAG
XL_TRANSCEIVER_TYPE_CAN_1040_MAG                 = _XL_TRANSCEIVER_TYPE_CAN_1040_MAG
XL_TRANSCEIVER_TYPE_CAN_1041A_MAG                = _XL_TRANSCEIVER_TYPE_CAN_1041A_MAG
XL_TRANSCEIVER_TYPE_TWIN_CAN_1041A_MAG           = _XL_TRANSCEIVER_TYPE_TWIN_CAN_1041A_MAG
XL_TRANSCEIVER_TYPE_TWIN_LIN_7269_MAG            = _XL_TRANSCEIVER_TYPE_TWIN_LIN_7269_MAG
XL_TRANSCEIVER_TYPE_TWIN_CAN_1041AV2_MAG         = _XL_TRANSCEIVER_TYPE_TWIN_CAN_1041AV2_MAG
XL_TRANSCEIVER_TYPE_TWIN_CAN_1054_1041A_MAG      = _XL_TRANSCEIVER_TYPE_TWIN_CAN_1054_1041A_MAG

# CAN PiggyBack
XL_TRANSCEIVER_TYPE_PB_CAN_251                   = _XL_TRANSCEIVER_TYPE_PB_CAN_251
XL_TRANSCEIVER_TYPE_PB_CAN_1054                  = _XL_TRANSCEIVER_TYPE_PB_CAN_1054
XL_TRANSCEIVER_TYPE_PB_CAN_251_OPTO              = _XL_TRANSCEIVER_TYPE_PB_CAN_251_OPTO
XL_TRANSCEIVER_TYPE_PB_CAN_SWC                   = _XL_TRANSCEIVER_TYPE_PB_CAN_SWC
XL_TRANSCEIVER_TYPE_PB_CAN_1054_OPTO             = _XL_TRANSCEIVER_TYPE_PB_CAN_1054_OPTO
XL_TRANSCEIVER_TYPE_PB_CAN_SWC_OPTO              = _XL_TRANSCEIVER_TYPE_PB_CAN_SWC_OPTO
XL_TRANSCEIVER_TYPE_PB_CAN_TT_OPTO               = _XL_TRANSCEIVER_TYPE_PB_CAN_TT_OPTO
XL_TRANSCEIVER_TYPE_PB_CAN_1050                  = _XL_TRANSCEIVER_TYPE_PB_CAN_1050
XL_TRANSCEIVER_TYPE_PB_CAN_1050_OPTO             = _XL_TRANSCEIVER_TYPE_PB_CAN_1050_OPTO
XL_TRANSCEIVER_TYPE_PB_CAN_1041                  = _XL_TRANSCEIVER_TYPE_PB_CAN_1041
XL_TRANSCEIVER_TYPE_PB_CAN_1041_OPTO             = _XL_TRANSCEIVER_TYPE_PB_CAN_1041_OPTO
XL_TRANSCEIVER_TYPE_PB_LIN_6258_OPTO             = _XL_TRANSCEIVER_TYPE_PB_LIN_6258_OPTO
XL_TRANSCEIVER_TYPE_PB_LIN_6259_OPTO             = _XL_TRANSCEIVER_TYPE_PB_LIN_6259_OPTO
XL_TRANSCEIVER_TYPE_PB_LIN_6259_MAG              = _XL_TRANSCEIVER_TYPE_PB_LIN_6259_MAG
XL_TRANSCEIVER_TYPE_PB_CAN_1041A_OPTO            = _XL_TRANSCEIVER_TYPE_PB_CAN_1041A_OPTO
XL_TRANSCEIVER_TYPE_PB_LIN_7259_MAG              = _XL_TRANSCEIVER_TYPE_PB_LIN_7259_MAG
XL_TRANSCEIVER_TYPE_PB_LIN_7269_MAG              = _XL_TRANSCEIVER_TYPE_PB_LIN_7269_MAG
XL_TRANSCEIVER_TYPE_PB_CAN_251_MAG               = _XL_TRANSCEIVER_TYPE_PB_CAN_251_MAG
XL_TRANSCEIVER_TYPE_PB_CAN_1050_MAG              = _XL_TRANSCEIVER_TYPE_PB_CAN_1050_MAG
XL_TRANSCEIVER_TYPE_PB_CAN_1040_MAG              = _XL_TRANSCEIVER_TYPE_PB_CAN_1040_MAG
XL_TRANSCEIVER_TYPE_PB_CAN_1041A_MAG             = _XL_TRANSCEIVER_TYPE_PB_CAN_1041A_MAG
XL_TRANSCEIVER_TYPE_PB_DAIO_8444_OPTO            = _XL_TRANSCEIVER_TYPE_PB_DAIO_8444_OPTO
XL_TRANSCEIVER_TYPE_PB_CAN_1054_MAG              = _XL_TRANSCEIVER_TYPE_PB_CAN_1054_MAG
XL_TRANSCEIVER_TYPE_CAN_1051_CAP_FIX             = _XL_TRANSCEIVER_TYPE_CAN_1051_CAP_FIX
XL_TRANSCEIVER_TYPE_DAIO_1021_FIX                = _XL_TRANSCEIVER_TYPE_DAIO_1021_FIX
XL_TRANSCEIVER_TYPE_LIN_7269_CAP_FIX             = _XL_TRANSCEIVER_TYPE_LIN_7269_CAP_FIX
XL_TRANSCEIVER_TYPE_PB_CAN_1051_CAP              = _XL_TRANSCEIVER_TYPE_PB_CAN_1051_CAP
XL_TRANSCEIVER_TYPE_PB_CAN_SWC_7356_CAP          = _XL_TRANSCEIVER_TYPE_PB_CAN_SWC_7356_CAP
XL_TRANSCEIVER_TYPE_PB_CAN_1055_CAP              = _XL_TRANSCEIVER_TYPE_PB_CAN_1055_CAP
XL_TRANSCEIVER_TYPE_PB_CAN_1057_CAP              = _XL_TRANSCEIVER_TYPE_PB_CAN_1057_CAP
XL_TRANSCEIVER_TYPE_A429_HOLT8596_FIX            = _XL_TRANSCEIVER_TYPE_A429_HOLT8596_FIX
XL_TRANSCEIVER_TYPE_A429_HOLT8455_FIX            = _XL_TRANSCEIVER_TYPE_A429_HOLT8455_FIX
XL_TRANSCEIVER_TYPE_PB_CAN_1051HG_CAP            = _XL_TRANSCEIVER_TYPE_PB_CAN_1051HG_CAP
XL_TRANSCEIVER_TYPE_CAN_1057_FIX                 = _XL_TRANSCEIVER_TYPE_CAN_1057_FIX
XL_TRANSCEIVER_TYPE_LIN_7269_FIX                 = _XL_TRANSCEIVER_TYPE_LIN_7269_FIX
XL_TRANSCEIVER_TYPE_PB_CAN_1462BT                = _XL_TRANSCEIVER_TYPE_PB_CAN_1462BT

# FlexRay PiggyBacks
XL_TRANSCEIVER_TYPE_PB_FR_1080                   = _XL_TRANSCEIVER_TYPE_PB_FR_1080
XL_TRANSCEIVER_TYPE_PB_FR_1080_MAG               = _XL_TRANSCEIVER_TYPE_PB_FR_1080_MAG
XL_TRANSCEIVER_TYPE_PB_FR_1080A_MAG              = _XL_TRANSCEIVER_TYPE_PB_FR_1080A_MAG
XL_TRANSCEIVER_TYPE_PB_FR_1082_CAP               = _XL_TRANSCEIVER_TYPE_PB_FR_1082_CAP
XL_TRANSCEIVER_TYPE_PB_FRC_1082_CAP              = _XL_TRANSCEIVER_TYPE_PB_FRC_1082_CAP
XL_TRANSCEIVER_TYPE_FR_1082_CAP_FIX              = _XL_TRANSCEIVER_TYPE_FR_1082_CAP_FIX
XL_TRANSCEIVER_TYPE_MOST150_ONBOARD              = _XL_TRANSCEIVER_TYPE_MOST150_ONBOARD

# Ethernet Phys
XL_TRANSCEIVER_TYPE_ETH_BCM54810_FIX             = _XL_TRANSCEIVER_TYPE_ETH_BCM54810_FIX
XL_TRANSCEIVER_TYPE_ETH_AR8031_FIX               = _XL_TRANSCEIVER_TYPE_ETH_AR8031_FIX
XL_TRANSCEIVER_TYPE_ETH_BCM89810_FIX             = _XL_TRANSCEIVER_TYPE_ETH_BCM89810_FIX
XL_TRANSCEIVER_TYPE_ETH_TJA1100_FIX              = _XL_TRANSCEIVER_TYPE_ETH_TJA1100_FIX
XL_TRANSCEIVER_TYPE_ETH_BCM54810_89811_FIX       = _XL_TRANSCEIVER_TYPE_ETH_BCM54810_89811_FIX
XL_TRANSCEIVER_TYPE_ETH_DP83XG710Q1_FIX          = _XL_TRANSCEIVER_TYPE_ETH_DP83XG710Q1_FIX
XL_TRANSCEIVER_TYPE_ETH_BCM54811S_FIX            = _XL_TRANSCEIVER_TYPE_ETH_BCM54811S_FIX
XL_TRANSCEIVER_TYPE_ETH_RTL9000AA_FIX            = _XL_TRANSCEIVER_TYPE_ETH_RTL9000AA_FIX
XL_TRANSCEIVER_TYPE_ETH_BCM89811_FIX             = _XL_TRANSCEIVER_TYPE_ETH_BCM89811_FIX
XL_TRANSCEIVER_TYPE_ETH_BCM54210_FIX             = _XL_TRANSCEIVER_TYPE_ETH_BCM54210_FIX
XL_TRANSCEIVER_TYPE_ETH_88Q2112_FIX              = _XL_TRANSCEIVER_TYPE_ETH_88Q2112_FIX
XL_TRANSCEIVER_TYPE_ETH_BCM84891_FIX             = _XL_TRANSCEIVER_TYPE_ETH_BCM84891_FIX

# IOpiggy 8642
XL_TRANSCEIVER_TYPE_PB_DAIO_8642                 = _XL_TRANSCEIVER_TYPE_PB_DAIO_8642
XL_TRANSCEIVER_TYPE_DAIO_AL_ONLY                 = _XL_TRANSCEIVER_TYPE_DAIO_AL_ONLY
XL_TRANSCEIVER_TYPE_DAIO_1021_FIX_WITH_AL        = _XL_TRANSCEIVER_TYPE_DAIO_1021_FIX_WITH_AL
XL_TRANSCEIVER_TYPE_DAIO_AL_WU                   = _XL_TRANSCEIVER_TYPE_DAIO_AL_WU
XL_TRANSCEIVER_TYPE_DAIO_1021_FIX_WITH_5V        = _XL_TRANSCEIVER_TYPE_DAIO_1021_FIX_WITH_5V

# Eth modules
XL_TRANSCEIVER_TYPE_ETH_MOD_BR_BCM89810          = _XL_TRANSCEIVER_TYPE_ETH_MOD_BR_BCM89810
XL_TRANSCEIVER_TYPE_ETH_MOD_IEEE_RGMII_AR8031    = _XL_TRANSCEIVER_TYPE_ETH_MOD_IEEE_RGMII_AR8031
XL_TRANSCEIVER_TYPE_ETH_MOD_IEEE_SGMII_AR8031    = _XL_TRANSCEIVER_TYPE_ETH_MOD_IEEE_SGMII_AR8031
XL_TRANSCEIVER_TYPE_ETH_MOD_BR_TJA1100           = _XL_TRANSCEIVER_TYPE_ETH_MOD_BR_TJA1100
XL_TRANSCEIVER_TYPE_ETH_MOD_BR_RTL9000AA         = _XL_TRANSCEIVER_TYPE_ETH_MOD_BR_RTL9000AA
XL_TRANSCEIVER_TYPE_ETH_MOD_BR_SGMII_DP83XG710Q1 = _XL_TRANSCEIVER_TYPE_ETH_MOD_BR_SGMII_DP83XG710Q1
XL_TRANSCEIVER_TYPE_ETH_MOD_BR_88Q2112           = _XL_TRANSCEIVER_TYPE_ETH_MOD_BR_88Q2112
XL_TRANSCEIVER_TYPE_ETH_MOD_BR_BCM89811          = _XL_TRANSCEIVER_TYPE_ETH_MOD_BR_BCM89811
XL_TRANSCEIVER_TYPE_ETH_MOD_BR_TJA1101           = _XL_TRANSCEIVER_TYPE_ETH_MOD_BR_TJA1101

# AE modules
XL_TRANSCEIVER_TYPE_AE_MOD_BR_BCM89883           = _XL_TRANSCEIVER_TYPE_AE_MOD_BR_BCM89883

# VT Ethernet piggy
XL_TRANSCEIVER_TYPE_PB_ETH_100BASET1_TJA1101     = _XL_TRANSCEIVER_TYPE_PB_ETH_100BASET1_TJA1101
XL_TRANSCEIVER_TYPE_PB_ETH_1000BASET1_88Q2112    = _XL_TRANSCEIVER_TYPE_PB_ETH_1000BASET1_88Q2112

# flags for channelCapabilities
# Time-Sync
XL_CHANNEL_FLAG_TIME_SYNC_RUNNING                = _XL_CHANNEL_FLAG_TIME_SYNC_RUNNING
XL_CHANNEL_FLAG_NO_HWSYNC_SUPPORT                = _XL_CHANNEL_FLAG_NO_HWSYNC_SUPPORT
# used to distinguish between VN2600 (w/o SPDIF) and VN2610 (with S/PDIF) 
XL_CHANNEL_FLAG_SPDIF_CAPABLE                    = _XL_CHANNEL_FLAG_SPDIF_CAPABLE
XL_CHANNEL_FLAG_CANFD_BOSCH_SUPPORT              = _XL_CHANNEL_FLAG_CANFD_BOSCH_SUPPORT
XL_CHANNEL_FLAG_CMACTLICENSE_SUPPORT             = _XL_CHANNEL_FLAG_CMACTLICENSE_SUPPORT
XL_CHANNEL_FLAG_CANFD_ISO_SUPPORT                = _XL_CHANNEL_FLAG_CANFD_ISO_SUPPORT

# defines for xlKlineInit5BdEcu
XL_KLINE_UNCONFIGURE_ECU                         = _XL_KLINE_UNCONFIGURE_ECU
XL_KLINE_CONFIGURE_ECU                           = _XL_KLINE_CONFIGURE_ECU

# define for addrNot
XL_KLINE_FLAG_TAKE_ADDRNOT                       = _XL_KLINE_FLAG_TAKE_ADDRNOT

# defines for xlKlineSetUartParams 
XL_KLINE_UART_PARITY_NONE                        = _XL_KLINE_UART_PARITY_NONE
XL_KLINE_UART_PARITY_EVEN                        = _XL_KLINE_UART_PARITY_EVEN
XL_KLINE_UART_PARITY_ODD                         = _XL_KLINE_UART_PARITY_ODD
XL_KLINE_UART_PARITY_MARK                        = _XL_KLINE_UART_PARITY_MARK
XL_KLINE_UART_PARITY_SPACE                       = _XL_KLINE_UART_PARITY_SPACE

# defines for xlKlineSwitchTesterResistor
XL_KLINE_TESTERRESISTOR_OFF                      = _XL_KLINE_TESTERRESISTOR_OFF
XL_KLINE_TESTERRESISTOR_ON                       = _XL_KLINE_TESTERRESISTOR_ON